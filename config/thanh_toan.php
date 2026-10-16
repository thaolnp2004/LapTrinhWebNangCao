<?php
// Điền các giá trị trong config/thanh_toan.local.php hoặc biến môi trường.
$paymentLocal = is_file(__DIR__.'/thanh_toan.local.php') ? require __DIR__.'/thanh_toan.local.php' : [];
function paymentConfig($name, $default = '') {
    global $paymentLocal;
    return $paymentLocal[$name] ?? (getenv('SUN_'.$name) ?: $default);
}
function gatewayEnabled($method) {
    if ($method === 'vnpay') return paymentConfig('VNPAY_TMN_CODE') && paymentConfig('VNPAY_HASH_SECRET');
    return $method === 'cod';
}
