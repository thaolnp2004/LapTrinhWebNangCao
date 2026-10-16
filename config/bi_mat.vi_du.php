<?php
// Sao chép file này thành bi_mat.php và điền thông tin thật vào

// ===== Database =====
define('DB_HOST',    '127.0.0.1');
define('DB_NAME',    'sun_cosmetic');
define('DB_USER',    'root');
define('DB_PASS',    '');
define('DB_CHARSET', 'utf8mb4');

// ===== SMTP (Gmail App Password) =====
define('SMTP_USER',         'thaolnpt04102004@gmail.com');
define('SMTP_PASS',         getenv('SUN_SMTP_PASS') ?: '');
define('SMTP_NOREPLY_USER', 'thaolnpt04102004@gmail.com');
define('SMTP_NOREPLY_PASS', getenv('SUN_SMTP_PASS') ?: '');
define('MAIL_FROM',         'thaolnpt04102004@gmail.com');

// ===== Google OAuth =====
require_once __DIR__ . '/google_oauth.php';
$sunGoogle = sunGoogleOAuthCredentials();
define('GOOGLE_CLIENT_ID', $sunGoogle['client_id']);
define('GOOGLE_CLIENT_SECRET', $sunGoogle['client_secret']);
unset($sunGoogle);
