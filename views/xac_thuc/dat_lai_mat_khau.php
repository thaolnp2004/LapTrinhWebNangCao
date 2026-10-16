<?php
$extraCss = ['auth.css'];
$hideNav  = true;
include ROOT_PATH . '/views/bo_cuc/dau_trang.php';
?>
<div class="auth-page">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="auth-card-sun">
                    <div class="auth-header-sun">
                        <div class="auth-icon-circle"><i class="fas fa-lock"></i></div>
                        <h3 class="auth-title-sun">Đặt lại mật khẩu</h3>
                        <p class="auth-subtitle-sun">Nhập mật khẩu mới cho tài khoản</p>
                    </div>
                    <?php if (!empty($error)): ?>
                    <div class="alert alert-danger"><i class="fas fa-exclamation-circle me-2"></i><?= htmlspecialchars($error) ?></div>
                    <?php endif; ?>
                    <form method="POST" action="<?= SITE_URL ?>/auth/resetPassword">
                        <input type="hidden" name="token" value="<?= htmlspecialchars($token) ?>">
                        <div class="form-group-sun">
                            <label class="form-label-sun">Mật khẩu mới</label>
                            <div class="input-wrap">
                                <i class="fas fa-lock input-icon"></i>
                                <input type="password" name="password" class="form-control form-sun" required minlength="6">
                            </div>
                        </div>
                        <div class="form-group-sun">
                            <label class="form-label-sun">Xác nhận mật khẩu</label>
                            <div class="input-wrap">
                                <i class="fas fa-lock input-icon"></i>
                                <input type="password" name="confirm_password" class="form-control form-sun" required minlength="6">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-sun w-100 mt-3">
                            <i class="fas fa-save me-2"></i>Đặt lại mật khẩu
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<?php include ROOT_PATH . '/views/bo_cuc/chan_trang.php'; ?>