<?php
/* Load categories for nav dropdowns */
require_once ROOT_PATH . '/models/DanhMuc.php';
$_navCatModel = new DanhMuc();
$_navCats     = $_navCatModel->getAll();

?>

<!-- =========================================================
     MAIN NAVBAR
     ========================================================= -->
<nav class="navbar-main">
    <div class="container">
        <div class="navbar-row">

            <!-- Logo -->
            <a href="<?= SITE_URL ?>" class="nav-logo">
               <img src="<?= ASSETS_URL ?>/images/sun-logo.png?v=<?= filemtime(ROOT_PATH.'/assets/images/sun-logo.png') ?>" 
                    alt="Sun Cosmetic"
                    class="logo-img">
            </a>

            <!-- Search -->
            <div class="nav-search-wrap">
                <form action="<?= SITE_URL ?>/products" method="GET" class="nav-search-form" id="searchForm">
                    <input type="text" name="q" id="searchInput"
                           placeholder="Tìm serum, kem dưỡng, chống nắng..."
                           autocomplete="off"
                           value="<?= htmlspecialchars($_GET['q'] ?? '') ?>">
                    <button type="submit" aria-label="Tìm kiếm">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                <div class="nav-search-dropdown" id="searchDropdown"></div>
            </div>

            <!-- Right side -->
            <div class="nav-right">

                <!-- Plain nav links (desktop) -->
                <a href="<?= SITE_URL ?>/products"
                   class="nav-link-plain" style="display:none" id="navSP">Sản phẩm</a>
                <a href="<?= SITE_URL ?>/about"
                   class="nav-link-plain" style="display:none" id="navPK">Về Sun</a>
                <a href="<?= SITE_URL ?>/khuyen-mai"
                   class="nav-link-plain" style="display:none" id="navKM">Khuyến mãi</a>
                <a href="<?= SITE_URL ?>/contact"
                   class="nav-link-plain" style="display:none" id="navLH">Liên hệ</a>

                <!-- Notification Bell (chỉ hiện khi đăng nhập) -->
                <?php if (isLoggedIn() && $currentUser): ?>
                <div class="nav-notif-wrap" id="notifWrap">
                    <button class="nav-icon-btn" id="notifToggleBtn" title="Thông báo" aria-label="Thông báo">
                        <i class="fas fa-bell"></i>
                        <span class="nav-badge nav-notif-badge d-none" id="notifBadge">0</span>
                    </button>
                    <div class="nav-notif-dropdown" id="notifDropdown">
                        <div class="notif-header">
                            <span class="fw-600">Thông báo</span>
                            <button class="notif-read-all" id="notifReadAll">Đánh dấu tất cả đã đọc</button>
                        </div>
                        <div class="notif-list" id="notifList">
                            <div class="notif-empty">
                                <i class="fas fa-bell-slash"></i>
                                <p>Chưa có thông báo nào</p>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endif; ?>

                <!-- Cart -->
                <button class="nav-icon-btn cart-toggle" id="cartToggleBtn" title="Giỏ hàng" aria-label="Giỏ hàng">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="nav-badge" id="cartBadgeNav"><?= $cartCount ?></span>
                </button>

                <!-- Account -->
                <?php if (isLoggedIn() && $currentUser): ?>
                <!-- Khách hàng đã đăng nhập -->
                <div class="nav-item">
                    <button class="nav-link-btn nav-user-btn">
                        <div class="nav-user-avatar">
                            <?php if (!empty($currentUser['anh_dai_dien'])): ?>
                                <img src="<?= imgUrl($currentUser['anh_dai_dien']) ?>" alt="">
                            <?php else: ?>
                                <span><?= mb_strtoupper(mb_substr($currentUser['ho_ten'], 0, 1)) ?></span>
                            <?php endif; ?>
                        </div>
                        <span class="d-none d-xl-inline" style="font-size:13px;max-width:88px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;margin-left:4px">
                            <?= htmlspecialchars(mb_substr($currentUser['ho_ten'], 0, 10)) ?>
                        </span>
                        <i class="fas fa-chevron-down" style="font-size:10px;margin-left:4px"></i>
                    </button>
                    <div class="nav-dropdown nav-user-dropdown">
                        <div class="nav-dd-header">
                            <?php $rank = getUserRankInfo($currentUser['hang'] ?? 'silver'); ?>
                            <strong><?= htmlspecialchars($currentUser['ho_ten']) ?></strong>
                            <small style="color:<?= $rank['color'] ?>"><?= $rank['icon'] ?> <?= $rank['name'] ?></small>
                            <small><?= htmlspecialchars($currentUser['thu_dien_tu'] ?? '') ?></small>
                        </div>
                        <a href="<?= SITE_URL ?>/account"><i class="fas fa-user"></i> Tài khoản</a>
                        <a href="<?= SITE_URL ?>/order"><i class="fas fa-box"></i> Đơn hàng</a>
                        <a href="<?= SITE_URL ?>/account/history"><i class="fas fa-history"></i> Lịch sử mua hàng</a>
                        <a href="<?= SITE_URL ?>/wishlist"><i class="fas fa-heart"></i> Yêu thích</a>
                        <hr>
                        <a href="<?= SITE_URL ?>/auth/logout" class="text-danger">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </div>
                </div>

                <?php elseif (isAdminLoggedIn()): ?>
                <!-- Admin / Nhân viên đang xem trang -->
                <?php
                    $adminSession  = $_SESSION['admin'];
                    $adminInitial = mb_strtoupper(mb_substr($adminSession['ho_ten'], 0, 1));
                    $adminRole = $adminSession['vai_tro'] ?? 'admin';
                    $isSuperAdmin  = in_array($adminRole, ['super_admin', 'admin']);
                    $roleLabel     = $isSuperAdmin ? 'Quản trị viên' : $adminRole;
                    $roleColor     = $isSuperAdmin ? '#c78195' : '#f59e0b';
                    $roleIcon      = $isSuperAdmin ? '🛡️' : '👤';
                    $avatarBg      = $isSuperAdmin ? 'linear-gradient(135deg,#c78195,#b63b64)' : 'linear-gradient(135deg,#f59e0b,#ef4444)';
                ?>
                <div class="nav-item">
                    <button class="nav-link-btn nav-user-btn">
                        <div class="nav-user-avatar" style="background:<?= $avatarBg ?>">
                            <img src="<?= ASSETS_URL ?>/images/sun-avatar.svg" alt="Sun Cosmetic" style="width:100%;height:100%">
                        </div>
                        <span class="d-none d-xl-inline" style="font-size:13px;max-width:88px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;margin-left:4px">
                            <?= htmlspecialchars(mb_substr($adminSession['ho_ten'], 0, 10)) ?>
                        </span>
                        <i class="fas fa-chevron-down" style="font-size:10px;margin-left:4px"></i>
                    </button>
                    <div class="nav-dropdown nav-user-dropdown">
                        <div class="nav-dd-header">
                            <strong><?= htmlspecialchars($adminSession['ho_ten']) ?></strong>
                            <small class="nav-role-badge" style="color:<?= $roleColor ?> !important;font-weight:600">
                                <?= $roleIcon ?> <?= htmlspecialchars($roleLabel) ?>
                            </small>
                            <small><?= htmlspecialchars($adminSession['thu_dien_tu'] ?? $adminSession['email'] ?? '') ?></small>
                        </div>
                        <a href="<?= SITE_URL ?>/admin">
                            <i class="fas fa-tachometer-alt"></i> Bảng điều khiển
                        </a>
                        <a href="<?= SITE_URL ?>/admin/products">
                            <i class="fas fa-spa"></i> Quản lý sản phẩm
                        </a>
                        <a href="<?= SITE_URL ?>/admin/orders">
                            <i class="fas fa-shopping-bag"></i> Quản lý đơn hàng
                        </a>
                        <hr>
                        <a href="<?= SITE_URL ?>/admin/logout" class="text-danger">
                            <i class="fas fa-sign-out-alt"></i> Đăng xuất
                        </a>
                    </div>
                </div>

                <?php else: ?>
                <!-- Chưa đăng nhập -->
                <a href="<?= SITE_URL ?>/auth/login"
                   class="nav-account-link nav-account-link--sm d-none d-sm-flex">
                    <i class="fas fa-sign-in-alt"></i>
                    <span>Đăng nhập</span>
                </a>
                <a href="<?= SITE_URL ?>/auth/register"
                   class="nav-account-link nav-account-link--reg d-none d-md-flex">
                    <i class="fas fa-user-plus"></i>
                    <span>Đăng ký</span>
                </a>
                <?php endif; ?>

                <!-- Theme toggle -->
                <button class="nav-theme-btn" id="themeToggle" title="Chuyển sáng/tối">
                    <i class="fas fa-moon" id="themeIcon"></i>
                </button>

                <!-- Mobile menu -->
                <button class="nav-mobile-btn d-xl-none" id="mobileToggle" aria-label="Menu" aria-controls="mobileDrawer" aria-expanded="false">
                    <i class="fas fa-bars"></i>
                </button>

            </div><!-- /nav-right -->
        </div><!-- /navbar-row -->
    </div>
</nav>

<!-- Mobile Drawer -->
<div class="mobile-drawer" id="mobileDrawer" role="dialog" aria-label="Menu Sun Cosmetic" aria-modal="true" aria-hidden="true" inert>
    <div class="drawer-header">
        <img src="<?= ASSETS_URL ?>/images/sun-logo.png?v=<?= filemtime(ROOT_PATH.'/assets/images/sun-logo.png') ?>" alt="Sun Cosmetic" style="height:65px;width:auto;display:block;">
        <button class="drawer-close" id="drawerClose" aria-label="Đóng menu"><i class="fas fa-times"></i></button>
    </div>
    <nav class="drawer-nav">
        <button type="button" class="drawer-theme-button" id="drawerThemeToggle"><i class="fas fa-moon"></i> Đổi giao diện sáng / tối</button>
        <a href="<?= SITE_URL ?>/products">
            <i class="fas fa-spa"></i> Mỹ phẩm
        </a>
        <a href="<?= SITE_URL ?>/about">
            <i class="fas fa-leaf"></i> Về Sun
        </a>
        <a href="<?= SITE_URL ?>/khuyen-mai">
            <i class="fas fa-bolt"></i> Khuyến mãi
        </a>
        <a href="<?= SITE_URL ?>/contact">
            <i class="fas fa-phone-alt"></i> Liên hệ
        </a>
        <?php if (isLoggedIn() && $currentUser): ?>
        <a href="<?= SITE_URL ?>/account">
            <i class="fas fa-user-circle"></i> Xin chào, <?= htmlspecialchars(mb_substr($currentUser['ho_ten'], 0, 15)) ?>
        </a>
        <a href="<?= SITE_URL ?>/account/history">
            <i class="fas fa-history"></i> Lịch sử mua hàng
        </a>
        <a href="<?= SITE_URL ?>/auth/logout" style="color:#ef4444">
            <i class="fas fa-sign-out-alt"></i> Đăng xuất
        </a>
        <?php elseif (isAdminLoggedIn()): ?>
        <a href="<?= SITE_URL ?>/admin" style="color:var(--color-primary);font-weight:700">
            <i class="fas fa-tachometer-alt"></i> Bảng điều khiển
        </a>
        <a href="<?= SITE_URL ?>/admin/logout" style="color:#ef4444">
            <i class="fas fa-sign-out-alt"></i> Đăng xuất Admin
        </a>
        <?php else: ?>
        <a href="<?= SITE_URL ?>/auth/login" style="color:var(--color-primary);font-weight:700">
            <i class="fas fa-user-circle"></i> Đăng nhập / Đăng ký
        </a>
        <?php endif; ?>
    </nav>
</div>
<div class="mobile-overlay" id="mobileOverlay"></div>

<script>
/* ── Theme toggle ── */
(function(){
    var html  = document.documentElement;
    var btn   = document.getElementById('themeToggle');
    var icon  = document.getElementById('themeIcon');
    var saved = localStorage.getItem('sun_theme');

    function setTheme(dark){
        html.classList.toggle('dark', dark);
        if(icon) icon.className = dark ? 'fas fa-sun' : 'fas fa-moon';
    }
    setTheme(saved === 'dark');

    if(btn) btn.addEventListener('click', function(){
        var isDark = html.classList.contains('dark');
        localStorage.setItem('sun_theme', isDark ? 'light' : 'dark');
        setTheme(!isDark);
    });

    /* Show desktop nav items */
    function showDesktop(){
        var isLg = window.innerWidth >= 1200;
        ['navSP','navPK','navKM','navLH'].forEach(function(id){
            var el = document.getElementById(id);
            if(el) el.style.display = isLg ? '' : 'none';
        });
    }
    showDesktop();
    window.addEventListener('resize', showDesktop);

    /* Mobile drawer */
    var drawer  = document.getElementById('mobileDrawer');
    var overlay = document.getElementById('mobileOverlay');
    var toggleB = document.getElementById('mobileToggle');
    var closeB  = document.getElementById('drawerClose');

    function openDrawer(){
        drawer.inert=false;
        drawer.setAttribute('aria-hidden','false');
        drawer.classList.add('open'); overlay.classList.add('open');
        toggleB.setAttribute('aria-expanded','true');
        document.body.style.overflow='hidden';
        closeB.focus();
    }
    function closeDrawer(){
        drawer.classList.remove('open'); overlay.classList.remove('open');
        drawer.setAttribute('aria-hidden','true'); drawer.inert=true;
        toggleB.setAttribute('aria-expanded','false');
        document.body.style.overflow='';
    }

    if(toggleB) toggleB.addEventListener('click', openDrawer);
    if(closeB)  closeB.addEventListener('click', closeDrawer);
    if(overlay) overlay.addEventListener('click', closeDrawer);
    var drawerTheme=document.getElementById('drawerThemeToggle');
    if(drawerTheme) drawerTheme.addEventListener('click',function(){if(btn)btn.click();});
    document.addEventListener('keydown',function(e){
        if(!drawer.classList.contains('open'))return;
        if(e.key==='Escape'){closeDrawer();toggleB.focus();}
        if(e.key==='Tab'){
            var focusable=Array.from(drawer.querySelectorAll('a[href],button:not([disabled])'));
            var first=focusable[0],last=focusable[focusable.length-1];
            if(e.shiftKey&&document.activeElement===first){e.preventDefault();last.focus();}
            else if(!e.shiftKey&&document.activeElement===last){e.preventDefault();first.focus();}
        }
    });
    window.matchMedia('(min-width:1200px)').addEventListener('change',function(e){if(e.matches)closeDrawer();});
})();

/* ── Notification Bell ── */
(function(){
    var btn      = document.getElementById('notifToggleBtn');
    var dropdown = document.getElementById('notifDropdown');
    var badge    = document.getElementById('notifBadge');
    var list     = document.getElementById('notifList');
    var readAll  = document.getElementById('notifReadAll');
    if (!btn) return;

    var isOpen   = false;
    var loaded   = false;

    function iconForType(type) {
        if (type === 'reply')   return '<i class="fas fa-reply notif-icon notif-icon--reply"></i>';
        if (type === 'voucher') return '<i class="fas fa-tag notif-icon notif-icon--voucher"></i>';
        if (type === 'order')   return '<i class="fas fa-box notif-icon notif-icon--order"></i>';
        return '<i class="fas fa-bell notif-icon notif-icon--info"></i>';
    }

    function timeAgo(dateStr) {
        var diff = Math.floor((Date.now() - new Date(dateStr).getTime()) / 1000);
        if (diff < 60)   return 'Vừa xong';
        if (diff < 3600) return Math.floor(diff/60) + ' phút trước';
        if (diff < 86400) return Math.floor(diff/3600) + ' giờ trước';
        return Math.floor(diff/86400) + ' ngày trước';
    }

    function resolveLink(link) {
        if (!link) return '';
        if (link.indexOf('http') === 0) return link;
        return window.SITE_URL + '/' + link.replace(/^\//, '');
    }

    function renderItems(items) {
        if (!items.length) {
            list.innerHTML = '<div class="notif-empty"><i class="fas fa-bell-slash"></i><p>Chưa có thông báo nào</p></div>';
            return;
        }
        list.innerHTML = items.map(function(n) {
            var cls = n.da_doc == 1 ? 'notif-item notif-item--read' : 'notif-item notif-item--unread';
            var resolved = resolveLink(n.lien_ket);
            var href = resolved ? ' href="' + resolved + '"' : '';
            var tag  = resolved ? 'a' : 'div';
            return '<' + tag + ' class="' + cls + '"' + href + ' data-id="' + n.id + '">'
                 + iconForType(n.loai)
                 + '<div class="notif-body">'
                 + '<div class="notif-title">' + escHtml(n.tieu_de) + '</div>'
                 + (n.noi_dung ? '<div class="notif-content">' + escHtml(n.noi_dung) + '</div>' : '')
                 + '<div class="notif-time">' + timeAgo(n.ngay_tao) + '</div>'
                 + '</div></' + tag + '>';
        }).join('');

        list.querySelectorAll('.notif-item--unread').forEach(function(el) {
            el.addEventListener('click', function() {
                markRead(parseInt(el.dataset.id));
                el.classList.replace('notif-item--unread', 'notif-item--read');
            });
        });
    }

    function escHtml(str) {
        return String(str).replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
    }

    function updateBadge(count) {
        if (count > 0) {
            badge.textContent = count > 99 ? '99+' : count;
            badge.classList.remove('d-none');
        } else {
            badge.classList.add('d-none');
        }
    }

    function loadNotifications() {
        fetch(window.SITE_URL + '/api/notifications')
            .then(function(r){ return r.json(); })
            .then(function(data) {
                updateBadge(data.chua_doc);
                renderItems(data.items || []);
                loaded = true;
            })
            .catch(function(){});
    }

    function markRead(id) {
        fetch(window.SITE_URL + '/api/notifications/read', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({id: id})
        }).then(function(r){ return r.json(); })
          .then(function(d){ updateBadge(d.chua_doc); });
    }

    btn.addEventListener('click', function(e) {
        e.stopPropagation();
        isOpen = !isOpen;
        dropdown.classList.toggle('open', isOpen);
        if (isOpen && !loaded) loadNotifications();
    });

    if (readAll) {
        readAll.addEventListener('click', function() {
            fetch(window.SITE_URL + '/api/notifications/read', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({id: 0})
            }).then(function(r){ return r.json(); })
              .then(function(d){
                  updateBadge(d.chua_doc);
                  list.querySelectorAll('.notif-item--unread').forEach(function(el){
                      el.classList.replace('notif-item--unread', 'notif-item--read');
                  });
              });
        });
    }

    document.addEventListener('click', function(e) {
        if (!dropdown.contains(e.target) && e.target !== btn) {
            isOpen = false;
            dropdown.classList.remove('open');
        }
    });

    // Load badge count ngay khi trang tải
    loadNotifications();

    // Tự động kiểm tra thông báo mới mỗi 60 giây
    setInterval(function() {
        fetch(window.SITE_URL + '/api/notifications')
            .then(function(r){ return r.json(); })
            .then(function(data) {
                updateBadge(data.chua_doc);
                if (isOpen) renderItems(data.items || []);
            })
            .catch(function(){});
    }, 60000);
})();
</script>
