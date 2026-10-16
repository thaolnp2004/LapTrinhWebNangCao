</main>
<footer class="sun-footer"><div class="container sun-footer-grid">
    <div><a href="<?= SITE_URL ?>"><img class="sun-footer-logo" src="<?= ASSETS_URL ?>/images/sun-logo.png" alt="Sun Cosmetic"></a><p>Chăm da dịu dàng.<br>Rạng rỡ theo cách của bạn.</p><a class="sun-email" href="mailto:<?= SHOP_EMAIL ?>"><?= SHOP_EMAIL ?></a></div>
    <div><h3>Khám phá Sun</h3><a href="<?= SITE_URL ?>/products">Tất cả mỹ phẩm</a><a href="<?= SITE_URL ?>/khuyen-mai">Ưu đãi của Sun</a><a href="<?= SITE_URL ?>/about">Câu chuyện thương hiệu</a><a href="<?= SITE_URL ?>/contact">Liên hệ & tư vấn</a></div>
    <div><h3>Chăm sóc khách hàng</h3><a href="<?= SITE_URL ?>/order/lookup">Tra cứu đơn hàng</a><a href="<?= SITE_URL ?>/policy/shipping">Giao hàng</a><a href="<?= SITE_URL ?>/policy/return">Đổi trả</a><a href="<?= SITE_URL ?>/policy/payment">Thanh toán</a><a href="<?= SITE_URL ?>/policy/privacy">Bảo mật thông tin</a></div>
    <div><h3>Một chút tin xinh từ Sun</h3><p>Đăng ký để nhận thông tin về sản phẩm và ưu đãi.</p><form action="<?= SITE_URL ?>/newsletter" method="post" class="sun-newsletter"><label class="visually-hidden" for="sunNewsEmail">Email nhận tin</label><input id="sunNewsEmail" type="email" name="email" placeholder="Email của bạn" required><button type="submit" aria-label="Đăng ký nhận tin"><i class="fas fa-arrow-right"></i></button></form><small>Bằng việc đăng ký, bạn đồng ý <a href="<?= SITE_URL ?>/policy/privacy">chính sách bảo mật</a>.</small><div class="sun-payment-tags"><span>COD</span><a href="https://sandbox.vnpayment.vn/tryitnow/Home/CreateOrder" target="_blank" rel="noopener">VNPay Demo</a></div></div>
</div><div class="container sun-footer-bottom"><span>© <?= date('Y') ?> Sun Cosmetic. All rights reserved.</span><span>Made with love <i class="far fa-heart"></i></span></div></footer>
<button class="scroll-top" id="scrollTopBtn" aria-label="Lên đầu trang"><i class="fas fa-arrow-up"></i></button>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<?= ASSETS_URL ?>/js/main.js"></script><script src="<?= ASSETS_URL ?>/js/cart.js?v=<?= filemtime(ROOT_PATH.'/assets/js/cart.js') ?>"></script>
<script src="<?= ASSETS_URL ?>/js/sun-responsive.js?v=<?= filemtime(ROOT_PATH.'/assets/js/sun-responsive.js') ?>"></script>
<?php if(!empty($extraJs)): foreach($extraJs as $js): ?><script src="<?= ASSETS_URL ?>/js/<?= htmlspecialchars($js) ?>"></script><?php endforeach; endif; ?>
</body></html>
