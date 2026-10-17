<?php
/**
 * Cấu hình kết nối cơ sở dữ liệu
 * Sun Cosmetic — Cửa hàng Mỹ phẩm & Chăm sóc sắc đẹp
 */

// ===== Site Configuration =====
define('SITE_NAME', 'Sun Cosmetic');
require_once __DIR__.'/url_site.php';
define('SITE_URL', sunSiteUrl());
define('SHOP_EMAIL', 'thaolnpt04102004@gmail.com');
define(
    'SHOP_STORAGE',
    getenv('SUN_SHOP_STORAGE') ?: sys_get_temp_dir() . '/sun_cosmetic'
);
require_once __DIR__.'/thanh_toan.php';
define('ADMIN_URL', SITE_URL . '/admin');
define('UPLOAD_URL', SITE_URL . '/tai_len');
define('ASSETS_URL', SITE_URL . '/assets');

// ===== Path Configuration =====
define('ROOT_PATH', dirname(__DIR__));
define('UPLOAD_PATH', ROOT_PATH . '/tai_len');
define('ADMIN_PATH', ROOT_PATH . '/admin');

// ===== Secrets / Production Environment =====
$localSecrets = __DIR__ . '/bi_mat.php';

if (is_file($localSecrets)) {
    // Local XAMPP
    require_once $localSecrets;
} else {
    // Heroku
    $dbUrl = getenv('JAWSDB_URL') ?: getenv('JAWSDB_MARIA_URL');

    if (!$dbUrl) {
        throw new RuntimeException('Missing JawsDB configuration.');
    }

    $db = parse_url($dbUrl);

    define('DB_HOST', $db['host']);
    define('DB_PORT', $db['port'] ?? 3306);
    define('DB_NAME', ltrim($db['path'], '/'));
    define('DB_USER', $db['user']);
    define('DB_PASS', $db['pass']);
    define('DB_CHARSET', 'utf8mb4');

    define('SMTP_USER', getenv('SUN_SMTP_USER') ?: SHOP_EMAIL);
    define('SMTP_PASS', getenv('SUN_SMTP_PASS') ?: '');
    define('SMTP_NOREPLY_USER', getenv('SUN_SMTP_USER') ?: SHOP_EMAIL);
    define('SMTP_NOREPLY_PASS', getenv('SUN_SMTP_PASS') ?: '');
    define('MAIL_FROM', getenv('SUN_SMTP_USER') ?: SHOP_EMAIL);

    require_once __DIR__ . '/google_oauth.php';

    $sunGoogle = sunGoogleOAuthCredentials();

    define('GOOGLE_CLIENT_ID', $sunGoogle['client_id']);
    define('GOOGLE_CLIENT_SECRET', $sunGoogle['client_secret']);

    unset($sunGoogle);
}

// ===== Other Settings =====
define('LOW_STOCK_WARNING', 5);
define('ITEMS_PER_PAGE', 8);
define('MAX_UPLOAD_SIZE', 5 * 1024 * 1024); // 5MB

// ===== Session & Timezone =====
date_default_timezone_set('Asia/Ho_Chi_Minh');
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// ===== Error Reporting (set false in production) =====
$debugEnv = getenv('SUN_DEBUG');
define('DEBUG', $debugEnv === false ? true : $debugEnv === '1');
if (DEBUG) {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
} else {
    error_reporting(0);
    ini_set('display_errors', 0);
}

// ===== Mail / SMTP Configuration =====
define('MAIL_FROM_NAME', 'Sun Cosmetic');
define('SMTP_HOST',      'smtp.gmail.com');
define('SMTP_PORT',      587);

// ===== Google OAuth =====
define('GOOGLE_REDIRECT_URI', SITE_URL . '/auth/googleCallback');

/**
 * Lớp Kết Nối CSDL — Singleton PDO
 * Cung cấp một kết nối duy nhất, hỗ trợ query/fetch/insert/execute
 */
class Database
{
    private static $instance = null;
    private $pdo;

    private function __construct()
    {
        $port = defined('DB_PORT') ? DB_PORT : 3306;

        $dsn = "mysql:host=" . DB_HOST .
       ";port=" . $port .
       ";dbname=" . DB_NAME .
       ";charset=" . DB_CHARSET;

        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
        ];
        try {
            $this->pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
        } catch (PDOException $e) {
            if (DEBUG) {
                die("Database connection failed: " . $e->getMessage());
            } else {
                die("Database connection failed.");
            }
        }
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }
        return self::$instance;
    }

    public function getConnection()
    {
        return $this->pdo;
    }

    public function query($sql, $params = [])
    {
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt;
    }

    public function fetch($sql, $params = [])
    {
        return $this->query($sql, $params)->fetch();
    }

    public function fetchAll($sql, $params = [])
    {
        return $this->query($sql, $params)->fetchAll();
    }

    public function insert($table, $data)
    {
        $cols = implode(',', array_keys($data));
        $placeholders = ':' . implode(', :', array_keys($data));
        $sql = "INSERT INTO $table ($cols) VALUES ($placeholders)";
        $this->query($sql, $data);
        return $this->pdo->lastInsertId();
    }

    public function execute($sql, $params = [])
    {
        return $this->query($sql, $params)->rowCount();
    }

    public function beginTransaction()
    {
        return $this->pdo->beginTransaction();
    }
    public function commit()
    {
        return $this->pdo->commit();
    }
    public function rollback()
    {
        return $this->pdo->rollBack();
    }
}

/** Hàm tiện ích lấy instance Database (dùng khắp nơi trong dự án) */
function db()
{
    return Database::getInstance();
}
