<?php
/** VNPay 2.1.0. IPN is the only path that marks an online order paid. */
class DieuKhienCongThanhToan {
    public static function vnpaySignature(array $data) {
        unset($data['vnp_SecureHash'],$data['vnp_SecureHashType']);
        $data=array_filter($data,fn($v,$k)=>strpos($k,'vnp_')===0 && is_scalar($v),ARRAY_FILTER_USE_BOTH);
        ksort($data);
        return hash_hmac('sha512',http_build_query($data,'','&',PHP_QUERY_RFC1738),paymentConfig('VNPAY_HASH_SECRET'));
    }
    private function publicUrl() {
        $url=rtrim(paymentConfig('PUBLIC_URL',SITE_URL),'/');
        if(strpos($url,'https://')!==0) throw new RuntimeException('Cần cấu hình URL HTTPS công khai cho kết quả thanh toán.');
        return $url;
    }
    public function start($id) {
        requireLogin();
        $order=db()->fetch('SELECT * FROM don_hang WHERE id=? AND id_nguoi_dung=?',[$id,$_SESSION['id_nguoi_dung']]);
        if(!$order || $order['trang_thai']==='cancelled') { http_response_code(404);echo 'Không tìm thấy đơn hàng';return; }
        if($order['trang_thai_thanh_toan']==='paid') redirect('/order/detail/'.$id);
        $method=$order['phuong_thuc_thanh_toan'];
        if($method!=='vnpay' || !gatewayEnabled($method)) { setFlash('warning','Cổng thanh toán chưa được kích hoạt. Liên hệ Sun để được hỗ trợ.');redirect('/order/detail/'.$id); }
        try {
            $public=$this->publicUrl();
            $ref=$order['ma_don_hang'].'-'.bin2hex(random_bytes(5));
            $amount=(int)round($order['tong_tien']);
            if($amount<=0)throw new RuntimeException('Số tiền thanh toán không hợp lệ.');
            db()->insert('thanh_toan',['id_don_hang'=>$id,'phuong_thuc'=>$method,'so_tien'=>$amount,'ma_tham_chieu'=>$ref,'trang_thai'=>'pending']);
            $data=['vnp_Version'=>'2.1.0','vnp_Command'=>'pay','vnp_TmnCode'=>paymentConfig('VNPAY_TMN_CODE'),'vnp_Amount'=>(string)($amount*100),'vnp_CurrCode'=>'VND','vnp_TxnRef'=>$ref,'vnp_OrderInfo'=>'Sun Cosmetic don hang '.$order['ma_don_hang'],'vnp_OrderType'=>'other','vnp_Locale'=>'vn','vnp_ReturnUrl'=>$public.'/payment/return/vnpay','vnp_IpAddr'=>$_SERVER['REMOTE_ADDR'] ?? '127.0.0.1','vnp_CreateDate'=>date('YmdHis'),'vnp_ExpireDate'=>date('YmdHis',time()+900)];
            ksort($data);$data['vnp_SecureHash']=self::vnpaySignature($data);
            $endpoint=paymentConfig('MODE','sandbox')==='production'?'https://pay.vnpay.vn/vpcpay.html':'https://sandbox.vnpayment.vn/paymentv2/vpcpay.html';
            header('Location: '.$endpoint.'?'.http_build_query($data,'','&',PHP_QUERY_RFC1738));exit;
        } catch(Throwable $e) { error_log('Sun payment: '.$e->getMessage());setFlash('warning','Chưa thể mở cổng thanh toán. Đơn hàng đã được lưu; liên hệ Sun để được hỗ trợ.');redirect('/order/detail/'.$id); }
    }
    public static function verify($method,array $data) {
        if($method!=='vnpay' || !gatewayEnabled($method)) return false;
        return ($data['vnp_TmnCode'] ?? '')===paymentConfig('VNPAY_TMN_CODE') && is_string($data['vnp_SecureHash'] ?? null) && hash_equals(self::vnpaySignature($data),$data['vnp_SecureHash']);
    }
    private function resultData(array $data) {
        return [(string)($data['vnp_TxnRef'] ?? ''),(int)($data['vnp_Amount'] ?? 0),($data['vnp_ResponseCode'] ?? '')==='00' && ($data['vnp_TransactionStatus'] ?? '')==='00',(string)($data['vnp_TransactionNo'] ?? '')];
    }
    public function ipn($method) {
        header('Content-Type: application/json; charset=utf-8');
        if($method!=='vnpay') { http_response_code(404);echo json_encode(['RspCode'=>'99','Message'=>'Unsupported payment method']);return; }
        $data=$_GET;
        if(!self::verify($method,$data)) { echo json_encode(['RspCode'=>'97','Message'=>'Invalid signature']);return; }
        [$ref,$amount,$success,$transaction]=$this->resultData($data);
        $db=db();$db->beginTransaction();
        try {
            // Lock order first so retries and duplicate callbacks serialize consistently.
            $payment=$db->fetch('SELECT * FROM thanh_toan WHERE ma_tham_chieu=? AND phuong_thuc=?',[$ref,$method]);
            if(!$payment){$db->rollback();echo json_encode(['RspCode'=>'01','Message'=>'Order not found']);return;}
            $order=$db->fetch('SELECT * FROM don_hang WHERE id=? FOR UPDATE',[$payment['id_don_hang']]);
            if((int)round($payment['so_tien']*100)!==$amount || (int)round($order['tong_tien']*100)!==$amount){$db->rollback();echo json_encode(['RspCode'=>'04','Message'=>'Invalid amount']);return;}
            if($order['trang_thai_thanh_toan']==='paid' || $order['trang_thai']==='cancelled'){$db->rollback();echo json_encode(['RspCode'=>'02','Message'=>'Order already confirmed']);return;}
            if($payment['trang_thai']==='success'){$db->rollback();echo json_encode(['RspCode'=>'02','Message'=>'Already processed']);return;}
            $db->execute('UPDATE thanh_toan SET trang_thai=?,ma_giao_dich=?,ngay_thanh_toan=NOW() WHERE id=?',[$success?'success':'failed',$transaction,$payment['id']]);
            $db->execute('UPDATE don_hang SET trang_thai_thanh_toan=? WHERE id=?',[$success?'paid':'failed',$order['id']]);
            $db->commit();
            echo json_encode(['RspCode'=>'00','Message'=>'Confirm Success']);
        }catch(Throwable $e){$db->rollback();error_log('Sun IPN: '.$e->getMessage());http_response_code(500);echo json_encode(['RspCode'=>'99','Message'=>'Processing error']);}
    }
    public function returnPage($method) {
        if($method!=='vnpay') { http_response_code(404);echo 'Phương thức thanh toán không được hỗ trợ.';return; }
        $data=$_GET;
        if(!self::verify($method,$data)) {setFlash('danger','Không xác thực được kết quả thanh toán. Vui lòng kiểm tra đơn hàng hoặc liên hệ Sun.');redirect('/order');}
        [$ref]=$this->resultData($data);
        $payment=db()->fetch('SELECT id_don_hang FROM thanh_toan WHERE ma_tham_chieu=? AND phuong_thuc=?',[$ref,$method]);
        if(!$payment){setFlash('danger','Không tìm thấy giao dịch.');redirect('/order');}
        setFlash('info','Kết quả thanh toán sẽ cập nhật sau khi cổng xác nhận. Bạn có thể xem trạng thái trong đơn hàng.');
        redirect('/order/detail/'.$payment['id_don_hang']);
    }
}
