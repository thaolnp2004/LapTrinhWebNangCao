<?php
$pageTitle = 'Mỹ phẩm & chăm sóc sắc đẹp';
$extraCss = ['home.css'];
include ROOT_PATH.'/views/bo_cuc/dau_trang.php';
$homeCategories = db()->fetchAll("SELECT * FROM danh_muc WHERE trang_thai='active' ORDER BY thu_tu");
?>
<section class="sun-hero container">
    <div class="sun-hero-copy">
        <span class="sun-eyebrow"><span class="sun-small-star">✺</span> BEAUTY IN YOUR EVERYDAY</span>
        <h1>Một chút nắng.<br>Một chút <em>yêu mình.</em></h1>
        <p>Chăm da thật dịu dàng, làm đẹp theo cách của bạn.<br>Khám phá những điều nhỏ xinh tại Sun Cosmetic.</p>
        <div class="sun-hero-actions"><a href="<?= SITE_URL ?>/products" class="sun-btn">Khám phá sản phẩm <i class="fas fa-arrow-right"></i></a><a href="<?= SITE_URL ?>/about" class="sun-text-link">Câu chuyện của Sun</a></div>
        <div class="sun-hero-note"><i class="fas fa-leaf"></i> Chọn điều phù hợp. Yêu làn da của bạn.</div>
    </div>
    <div class="sun-hero-photo"><img src="<?= ASSETS_URL ?>/images/sun-hero.png" alt="Bộ mỹ phẩm trong ánh nắng nhẹ với hoa hồng" fetchpriority="high"><div class="sun-photo-label"><span>THE DAILY GLOW</span><strong>Rạng rỡ mỗi ngày</strong></div></div>
</section>
<div class="sun-benefit-strip"><div class="container"><span><i class="fas fa-box-open"></i> Đóng gói cẩn thận</span><span><i class="fas fa-truck"></i> Freeship từ 500.000đ</span><span><i class="far fa-heart"></i> Tư vấn cùng Sun</span><span><i class="fas fa-retweet"></i> Hỗ trợ đổi trả 7 ngày</span></div></div>
<section class="sun-section container">
    <div class="sun-section-head"><div><span class="sun-eyebrow">YOUR BEAUTY, YOUR WAY</span><h2>Hôm nay, bạn cần gì?</h2></div><a class="sun-text-link" href="<?= SITE_URL ?>/products">Tất cả sản phẩm <i class="fas fa-arrow-right"></i></a></div>
    <div class="sun-categories">
        <?php foreach($homeCategories as $cat): ?><a class="sun-category" href="<?= SITE_URL ?>/category/<?= htmlspecialchars($cat['duong_dan']) ?>"><div><img src="<?= imgUrl($cat['hinh_anh']) ?>" alt="<?= htmlspecialchars($cat['ten']) ?>" loading="lazy"></div><span><?= htmlspecialchars($cat['ten']) ?></span></a><?php endforeach; ?>
    </div>
</section>
<section class="sun-section container" id="sun-picks">
    <div class="sun-section-head"><div><span class="sun-eyebrow">HANDPICKED FOR YOU</span><h2>Sun chọn cho bạn <span class="sun-small-star">✺</span></h2><p>Những món nhỏ xinh cho chu trình chăm sóc mỗi ngày.</p></div><a href="<?= SITE_URL ?>/products?sort=newest" class="sun-text-link">Khám phá thêm <i class="fas fa-arrow-right"></i></a></div>
    <div class="sun-products"><?php foreach(array_slice($featured,0,8) as $product) include ROOT_PATH.'/views/san_pham/_the_san_pham.php'; ?></div>
</section>
<section class="container sun-offer"><div><span class="sun-eyebrow">A LITTLE TREAT FROM SUN</span><h2>Chào bạn mới,<br>Sun có một món quà.</h2><p>Giảm 10% với mã <strong>SUN10</strong> cho đơn từ 299.000đ.<br>Giảm tối đa 50.000đ · Đến 31/12/2026.</p><a href="<?= SITE_URL ?>/khuyen-mai" class="sun-btn">Xem ưu đãi của Sun <i class="fas fa-arrow-right"></i></a></div><div class="sun-offer-art"><span>with love,</span><strong>Sun</strong><i>✺</i></div></section>
<section class="sun-section container"><div class="sun-section-head"><div><span class="sun-eyebrow">FIND YOUR DAILY RITUAL</span><h2>Một chu trình, nhiều yêu thương</h2></div></div><div class="sun-routines">
    <a href="<?= SITE_URL ?>/category/lam-sach"><span>01 / CLEANSE</span><h3>Da sạch, lòng nhẹ.</h3><p>Bắt đầu với bước làm sạch dịu dàng.</p><i class="fas fa-arrow-right"></i></a>
    <a href="<?= SITE_URL ?>/category/serum-tinh-chat"><span>02 / NOURISH</span><h3>Nuôi dưỡng mỗi ngày.</h3><p>Thêm tinh chất phù hợp vào chu trình.</p><i class="fas fa-arrow-right"></i></a>
    <a href="<?= SITE_URL ?>/category/chong-nang"><span>03 / PROTECT</span><h3>Đón nắng thật xinh.</h3><p>Hoàn thiện bước chăm sóc ban ngày.</p><i class="fas fa-arrow-right"></i></a>
</div></section>
<section class="sun-story container"><div class="sun-story-mark">✺</div><span class="sun-eyebrow">HELLO, WE'RE SUN COSMETIC</span><h2>Vẻ đẹp bắt đầu từ<br>cách bạn chăm sóc chính mình.</h2><p>Sun là góc nhỏ dành cho những ai yêu việc chăm da và chăm mình.<br>Từ bước làm sạch đến dưỡng ẩm, tụi mình cùng bạn tìm điều phù hợp.</p><a href="<?= SITE_URL ?>/contact" class="sun-text-link">Trò chuyện cùng Sun <i class="fas fa-arrow-right"></i></a></section>
<?php include ROOT_PATH.'/views/bo_cuc/chan_trang.php'; ?>
