<?php
/** Thông tin Google riêng của Sun Cosmetic, lưu ngoài thư mục web. */
function sunGoogleOAuthCredentials(): array
{
    $id = trim((string) getenv('SUN_GOOGLE_CLIENT_ID'));
    $secret = trim((string) getenv('SUN_GOOGLE_CLIENT_SECRET'));
    if ($id !== '' || $secret !== '') {
        return ($id !== '' && $secret !== '')
            ? ['client_id' => $id, 'client_secret' => $secret]
            : ['client_id' => '', 'client_secret' => ''];
    }

    $path = trim((string) getenv('SUN_GOOGLE_CREDENTIALS_FILE'));
    if ($path === '') {
        $path = 'C:/xampp/sun_cosmetic_work/storage/google/client_secret.json';
    }
    if (is_file($path)) {
        $json = is_readable($path) ? file_get_contents($path) : false;
        $data = $json !== false ? json_decode($json, true) : null;
        $web = is_array($data) && isset($data['web']) && is_array($data['web']) ? $data['web'] : [];
        $id = trim((string) ($web['client_id'] ?? ''));
        $secret = trim((string) ($web['client_secret'] ?? ''));
        return ($id !== '' && $secret !== '')
            ? ['client_id' => $id, 'client_secret' => $secret]
            : ['client_id' => '', 'client_secret' => ''];
    }

    return ['client_id' => '', 'client_secret' => ''];
}
