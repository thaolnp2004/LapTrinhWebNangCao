<?php
/** Giữ liên kết Sun Cosmetic theo đúng địa chỉ máy chủ đang được truy cập. */
function sunSiteUrl(): string {
    $configured = getenv('SUN_SITE_URL');
    if ($configured) return rtrim($configured, '/');

    $fallback = 'http://localhost/sun_cosmetic';
    $host = $_SERVER['HTTP_HOST'] ?? 'localhost';
    if (!is_string($host) || !preg_match('/^(?:[a-z0-9.-]+|\[[0-9a-f:]+\])(?::[0-9]{1,5})?$/i', $host)) return $fallback;
    $parts = parse_url('http://' . $host);
    if (!$parts || empty($parts['host'])) return $fallback;
    $hostname = strtolower(trim($parts['host'], '[]'));
    // SERVER_ADDR comes from the local listener, not the submitted Host header.
    $allowed = ['localhost', '127.0.0.1', '::1', 'sun-cosmetic.test', strtolower($_SERVER['SERVER_ADDR'] ?? '')];
    if (!in_array($hostname, $allowed, true)) return $fallback;
    if (isset($parts['port']) && ($parts['port'] < 1 || $parts['port'] > 65535)) return $fallback;
    $scheme = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' ? 'https' : 'http';
    return $scheme . '://' . strtolower($host) . '/sun_cosmetic';
}
