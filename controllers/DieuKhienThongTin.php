<?php
class DieuKhienThongTin {
    public function index($slug='about') {
        $pages = [
            'terms'=>['Điều khoản mua sắm','<p>Khi tạo tài khoản hoặc đặt hàng tại Sun Cosmetic, hãy cung cấp email, số điện thoại và địa chỉ chính xác để Sun hỗ trợ và giao hàng. Bạn quản lý mật khẩu tài khoản của mình; Sun không yêu cầu cung cấp mật khẩu hoặc mã OTP qua email hay tin nhắn.</p><h2>Thông tin sản phẩm và đơn hàng</h2><p>Kiểm tra tên mỹ phẩm, dung tích, cách dùng, số lượng, giá và ưu đãi trước khi đặt hàng. Giá được hiển thị bằng đồng Việt Nam. Đơn hàng mới được ghi nhận ở trạng thái chờ xử lý; Sun sẽ cập nhật tiến trình trong tài khoản và trang tra cứu đơn hàng.</p><h2>Giao hàng, thanh toán và đổi trả</h2><p>Phí giao hàng tiêu chuẩn là 30.000đ, miễn phí cho đơn có giá trị sản phẩm từ 500.000đ trước khi áp dụng mã giảm giá. COD hiện được hỗ trợ; các phương thức trực tuyến chỉ chọn được khi shop đã cấu hình xong.</p><p>Chi tiết được công bố tại <a href="'.SITE_URL.'/policy/shipping">chính sách giao hàng</a>, <a href="'.SITE_URL.'/policy/payment">chính sách thanh toán</a> và <a href="'.SITE_URL.'/policy/return">chính sách đổi trả</a>.</p><h2>Thông tin tài khoản</h2><p>Việc sử dụng thông tin tài khoản và giao hàng được mô tả trong <a href="'.SITE_URL.'/policy/privacy">chính sách bảo mật</a>. Nếu cần sửa thông tin hoặc hỗ trợ về đơn hàng, hãy liên hệ Sun bằng email quản lý shop.</p>'],
            'about'=>['Câu chuyện của Sun','<p>Sun Cosmetic là góc nhỏ dành cho việc chăm sóc da và làm đẹp mỗi ngày. Chúng mình mong muốn bạn có thể tìm được sản phẩm phù hợp với nhu cầu và chu trình riêng.</p><h2>Chăm mình, theo cách của bạn</h2><p>Từ làm sạch, cân bằng, dưỡng ẩm đến chống nắng, Sun sắp xếp sản phẩm theo từng bước để bạn dễ lựa chọn. Thông tin dung tích, đối tượng phù hợp và cách dùng có ở trang chi tiết.</p><h2>Cùng bạn trước và sau khi mua</h2><p>Bạn có thể gửi lời nhắn để hỏi về sản phẩm, tra cứu đơn hàng và yêu cầu hỗ trợ sau khi mua.</p>'],
            'shipping'=>['Chính sách giao hàng','<p>Sun Cosmetic giao hàng toàn quốc. Phí vận chuyển tiêu chuẩn là 30.000đ, miễn phí cho đơn có tổng giá trị sản phẩm từ 500.000đ trước khi áp dụng mã giảm giá.</p><p>Thời gian giao hàng dự kiến 2–5 ngày làm việc kể từ khi đơn được xác nhận, tùy địa chỉ và đơn vị vận chuyển. Đơn ngoại thành hoặc vùng xa có thể cần thêm thời gian; Sun sẽ trao đổi trước khi giao.</p><p>Kiểm tra bao bì khi nhận hàng. Nếu kiện hàng bị hỏng hoặc có dấu hiệu bất thường, hãy ghi lại hình ảnh và liên hệ Sun để được hỗ trợ.</p>'],
            'return'=>['Chính sách đổi trả','<p>Liên hệ Sun trong 7 ngày kể từ ngày nhận hàng nếu sản phẩm giao sai hoặc có lỗi. Giữ lại hộp, hóa đơn hoặc mã đơn hàng và hình ảnh tình trạng sản phẩm để Sun kiểm tra.</p><p>Mỹ phẩm đã mở nắp, đã sử dụng hoặc hỏng do bảo quản không đúng hướng dẫn không áp dụng đổi trả do thay đổi nhu cầu. Trường hợp lỗi sản phẩm được xử lý riêng sau khi xác minh.</p><p>Sun xác nhận phương án đổi sản phẩm hoặc hoàn tiền và chi phí vận chuyển với bạn trước khi xử lý.</p>'],
            'payment'=>['Thanh toán tại Sun','<p>COD: thanh toán cho đơn vị vận chuyển khi nhận hàng. VNPay sẽ được mở khi shop hoàn tất đăng ký với cổng thanh toán.</p><p>Với thanh toán trực tuyến, khách hàng xác nhận giao dịch trên trang chính thức của VNPay. Sun chỉ cập nhật đã thanh toán khi xác thực được kết quả từ cổng thanh toán.</p><p>Email quản lý shop là thaolnpt04102004@gmail.com. Sun không yêu cầu gửi mật khẩu, mã OTP hoặc thông tin thẻ qua email.</p>'],
            'privacy'=>['Bảo mật thông tin','<p>Sun lưu thông tin tài khoản, liên hệ và địa chỉ giao hàng để xử lý đơn hàng, hỗ trợ khách hàng và quản lý lịch sử mua sắm.</p><p>Email đăng ký nhận tin được lưu riêng để gửi thông tin về sản phẩm và ưu đãi. Bạn có thể yêu cầu ngừng nhận tin hoặc xóa dữ liệu bằng cách liên hệ email quản lý shop.</p><p>Thông tin thanh toán thẻ được xử lý tại cổng thanh toán; Sun không lưu số thẻ hoặc mã bảo mật thẻ. Thông tin giao hàng cần thiết có thể được cung cấp cho đơn vị vận chuyển để hoàn thành đơn hàng.</p>'],
        ];
        if(!isset($pages[$slug])) { http_response_code(404);$pageTitle='Không tìm thấy trang';$content='<p>Trang này chưa có. Mời bạn quay lại cửa hàng.</p>'; }
        else [$pageTitle,$content]=$pages[$slug];
        require ROOT_PATH.'/views/thong_tin.php';
    }
    public function newsletter() {
        if($_SERVER['REQUEST_METHOD']!=='POST') redirect('/');
        $email=trim($_POST['email'] ?? '');
        if(filter_var($email,FILTER_VALIDATE_EMAIL)) {
            db()->query('INSERT IGNORE INTO dang_ky_nhan_tin (thu_dien_tu) VALUES (?)',[$email]);
            setFlash('success','Sun đã lưu đăng ký nhận tin của bạn. Cảm ơn bạn!');
        } else setFlash('danger','Vui lòng nhập email hợp lệ.');
        redirect('/');
    }
}
