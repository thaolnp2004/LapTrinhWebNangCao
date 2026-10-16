<?php
/**
 * Điều Khiển Sản Phẩm
 * Danh sách, tìm kiếm, lọc theo danh mục và trang chi tiết sản phẩm
 */

require_once ROOT_PATH . '/models/SanPham.php';
require_once ROOT_PATH . '/models/DanhMuc.php';

class DieuKhienSanPham {
    private $sanPhamModel;
    private $danhMucModel;

    public function __construct() {
        $this->sanPhamModel = new SanPham();
        $this->danhMucModel = new DanhMuc();
    }

    /** Danh sách sản phẩm — trang mỹ phẩm, flash sale, tìm kiếm */
    public function index() {
        $allCats = $this->danhMucModel->getAll();
        $search = trim($_GET['q'] ?? '');
        $selectedCategories = array_values(array_filter(array_map('intval', (array)($_GET['categories'] ?? []))));
        if (!empty($_GET['category'])) $selectedCategories = [(int)$_GET['category']];
        $selectedPriceRanges = (array)($_GET['price_ranges'] ?? []);
        [$minPrice, $maxPrice] = $this->_parsePriceRanges($selectedPriceRanges);
        $filters = ['search'=>$search, 'sort'=>$_GET['sort'] ?? 'newest', 'category_ids'=>$selectedCategories, 'thuong_hieu'=>$_GET['thuong_hieu'] ?? '', 'loai_da'=>$_GET['loai_da'] ?? ''];
        if ($minPrice !== null) $filters['min_price']=$minPrice;
        if ($maxPrice !== null) $filters['max_price']=$maxPrice;
        if (!empty($_GET['min_price'])) $filters['min_price']=(int)$_GET['min_price'];
        if (!empty($_GET['max_price'])) $filters['max_price']=(int)$_GET['max_price'];
        if (!empty($_GET['flash_sale'])) $filters['flash_sale']=1;
        $page=max(1,(int)($_GET['page'] ?? 1));
        $products=$this->sanPhamModel->getAll($filters,ITEMS_PER_PAGE,($page-1)*ITEMS_PER_PAGE);
        $totalCount=$this->sanPhamModel->countAll($filters);
        $totalPages=(int)ceil($totalCount/ITEMS_PER_PAGE);
        $sidebarCategories=$allCats;
        $pageTitle=$search ? 'Tìm kiếm: '.$search : (!empty($_GET['flash_sale']) ? 'Mỹ phẩm ưu đãi' : 'Tất cả mỹ phẩm');
        $pageSubtitle='Chọn một điều nhỏ xinh cho chu trình chăm sóc của bạn.';
        $pageType='cosmetics';$currentSort=$filters['sort'];$groupedProducts=null;
        require ROOT_PATH.'/views/san_pham/danh_sach.php';
    }

    /** Trang chi tiết sản phẩm theo slug */
    public function detail($slug) {
        $product = $this->sanPhamModel->getBySlug($slug);
        if (!$product) {
            redirect('/404');
            return;
        }

        $this->sanPhamModel->incrementView($product['id']);

        $images   = $this->sanPhamModel->getImages($product['id']);
        $reviews  = $this->sanPhamModel->getReviews($product['id']);
        $comments = $this->sanPhamModel->getComments($product['id']);
        $related  = $this->sanPhamModel->getRelated($product['id'], $product['id_danh_muc'], 4);

        $specs = [];
        if (!empty($product['thong_so'])) {
            $decoded = json_decode($product['thong_so'], true);
            if (is_array($decoded)) $specs = $decoded;
        }

        $colorVariants = $this->sanPhamModel->getColorVariants(
            $product['id'], $product['id_danh_muc'], $product['thuong_hieu'] ?? ''
        );

        $inWishlist = false;
        if (isLoggedIn()) {
            require_once ROOT_PATH . '/models/YeuThich.php';
            $yeuThich   = new YeuThich();
            $inWishlist = $yeuThich->isInWishlist($_SESSION['id_nguoi_dung'], $product['id']);
        }

        $pageTitle = $product['ten'];
        require_once ROOT_PATH . '/views/san_pham/chi_tiet.php';
    }

    /** AJAX: Nội dung modal xem nhanh sản phẩm */
    public function quickview($id) {
        $product = $this->sanPhamModel->getById($id);
        if (!$product) {
            http_response_code(404);
            echo '<p class="text-center py-4">Không tìm thấy sản phẩm</p>';
            exit;
        }
        $images = $this->sanPhamModel->getImages($product['id']);
        require_once ROOT_PATH . '/views/san_pham/_xem_nhanh.php';
        exit;
    }

    /** AJAX: Gợi ý tìm kiếm tự động */
    public function searchSuggest() {
        header('Content-Type: application/json');
        $q = trim($_GET['q'] ?? '');
        if (strlen($q) < 2) {
            echo json_encode([]);
            exit;
        }
        $results = $this->sanPhamModel->search($q, 6);
        $out = array_map(function ($p) {
            return [
                'ten'           => $p['ten'],
                'duong_dan'     => $p['duong_dan'],
                'hinh_thu_nho'  => imgUrl($p['hinh_thu_nho']),
                'gia_dinh_dang' => formatPrice($p['gia_khuyen_mai'] ?: $p['gia']),
            ];
        }, $results);
        echo json_encode($out);
        exit;
    }

    /** Lọc sản phẩm theo slug danh mục */
    public function category($slug) {
        $category = $this->danhMucModel->getBySlug($slug);
        if (!$category) {
            redirect('/404');
            return;
        }

        $currentSort         = $_GET['sort'] ?? 'newest';
        $selectedCategories  = array_map('intval', (array)($_GET['categories'] ?? [$category['id']]));
        $selectedPriceRanges = (array)($_GET['price_ranges'] ?? []);
        $page    = max(1, (int)($_GET['page'] ?? 1));
        $perPage = ITEMS_PER_PAGE;
        $offset  = ($page - 1) * $perPage;

        [$minPrice, $maxPrice] = $this->_parsePriceRanges($selectedPriceRanges);
        if ($minPrice === null && !empty($_GET['min_price'])) $minPrice = (int)$_GET['min_price'];
        if ($maxPrice === null && !empty($_GET['max_price'])) $maxPrice = (int)$_GET['max_price'];

        $filters = ['category_ids' => $selectedCategories, 'sort' => $currentSort];
        if ($minPrice !== null) $filters['min_price'] = $minPrice;
        if ($maxPrice !== null) $filters['max_price'] = $maxPrice;

        $products   = $this->sanPhamModel->getAll($filters, $perPage, $offset);
        $totalCount = $this->sanPhamModel->countAll($filters);
        $totalPages = ceil($totalCount / $perPage);

        $allCats = $this->danhMucModel->getAll();
        $sidebarCategories = $allCats;

        $pageTitle    = $category['ten'];
        $pageSubtitle = 'Xem tất cả sản phẩm trong danh mục ' . $category['ten'];
        $pageType = 'cosmetics';

        require_once ROOT_PATH . '/views/san_pham/danh_sach.php';
    }

    // ── Private helpers ────────────────────────────────────────

    private function _getCosmeticCategories(array $allCats): array { return $allCats; }

    private function _getAccCategories(array $allCats): array { return $allCats; }

    private function _parsePriceRanges(array $ranges): array {
        if (empty($ranges)) return [null, null];
        $mins = []; $maxes = [];
        foreach ($ranges as $r) {
            if (strpos($r, '+') !== false) {
                $mins[] = (int) str_replace('+', '', $r);
            } else {
                $parts = explode('-', $r);
                $mins[] = (int)($parts[0] ?? 0);
                if (isset($parts[1]) && (int)$parts[1] > 0) {
                    $maxes[] = (int)$parts[1];
                }
            }
        }
        return [!empty($mins) ? min($mins) : null, !empty($maxes) ? max($maxes) : null];
    }

    private function _buildFilters(
        array $selectedCats, array $sidebarCats, string $sort, ?int $minPrice, ?int $maxPrice
    ): array {
        $filters = ['sort' => $sort];
        if (!empty($selectedCats)) {
            $filters['category_ids'] = $selectedCats;
        } else {
            $ids = array_column($sidebarCats, 'id');
            if (!empty($ids)) $filters['category_ids'] = $ids;
        }
        if ($minPrice !== null) $filters['min_price'] = $minPrice;
        if ($maxPrice !== null) $filters['max_price'] = $maxPrice;
        return $filters;
    }
}
