/* Sun Cosmetic: resize-aware filters, touch account menus and header offsets. */
(function () {
    'use strict';
    const compact = window.matchMedia('(max-width:1199px)');
    const filter = document.querySelector('.sun-filter-form details');
    function fitFilter() {
        if (filter) filter.open = !compact.matches;
    }
    fitFilter();
    compact.addEventListener('change', fitFilter);

    const header = document.querySelector('.navbar-main');
    if (header && window.ResizeObserver) {
        new ResizeObserver(function () {
            document.documentElement.style.setProperty('--nav-h', Math.ceil(header.getBoundingClientRect().height) + 'px');
        }).observe(header);
    }

    const account = document.querySelector('.nav-user-btn');
    const item = account && account.closest('.nav-item');
    function closeAccount() {
        if (!account) return;
        item.classList.remove('is-open');
        account.setAttribute('aria-expanded', 'false');
    }
    if (account && item) {
        account.setAttribute('aria-expanded', 'false');
        account.setAttribute('aria-label', 'Tài khoản');
        account.addEventListener('click', function () {
            const open = item.classList.toggle('is-open');
            account.setAttribute('aria-expanded', String(open));
        });
        document.addEventListener('click', function (event) {
            if (!item.contains(event.target)) closeAccount();
        });
        document.addEventListener('keydown', function (event) {
            if (event.key === 'Escape') closeAccount();
        });
    }
})();
