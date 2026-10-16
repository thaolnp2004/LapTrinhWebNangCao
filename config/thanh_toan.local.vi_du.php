<?php
// Sao chép thành thanh_toan.local.php. Không đưa file chứa khóa vào Git.
// Dùng khóa sandbox để thử trước; chỉ bật production khi shop đã được duyệt.
return [
    'MODE' => 'sandbox',
    'PUBLIC_URL' => '', // URL HTTPS công khai để VNPay gọi IPN, không dùng localhost.
    'VNPAY_TMN_CODE' => '',
    'VNPAY_HASH_SECRET' => '',
];
