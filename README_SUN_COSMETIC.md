# Sun Cosmetic

Website PHP/MySQL dành cho cửa hàng mỹ phẩm Sun Cosmetic.

- Website: http://localhost/sun_cosmetic/
- Quản trị: http://localhost/sun_cosmetic/admin/login
- Database: `sun_cosmetic`; file nhập: `co_so_du_lieu/sun_cosmetic.sql`.
- Email quản lý: `thaolnpt04102004@gmail.com`.
- Tài khoản quản trị và mật khẩu tạo riêng được lưu tại `C:\xampp\sun_cosmetic_work\ADMIN_ACCESS.txt`, ngoài thư mục phục vụ web.
- Bản sao mã nguồn ban đầu: `C:\xampp\sun_cosmetic_work\original_source_backup`.

## Nội dung và vận hành

20 sản phẩm Cocoon, 10 danh mục và 60 ảnh sản phẩm lưu cục bộ. Giá/tồn kho/ưu đãi là dữ liệu khởi tạo để dùng và thử website; rà soát theo hàng thực tế trước khi kinh doanh. Không sử dụng đánh giá, lượt bán hay thông tin khách hàng mẫu của shop cũ.

Quản trị có trường dung tích, loại da/đối tượng, xuất xứ, thành phần và hướng dẫn sử dụng. Có thể chỉnh giá, kho, ảnh và mô tả. Đường dẫn sản phẩm được giữ khi chỉ sửa thông tin và giữ nguyên tên.

Phí giao hàng: 30.000đ; miễn phí từ 500.000đ trước mã giảm giá. `SUN10`: giảm 10% đơn từ 299.000đ, tối đa 50.000đ. `SUN30K`: giảm 30.000đ đơn từ 399.000đ. Hai mã hết hạn 31/12/2026.

## VNPay demo miễn phí

Shop hỗ trợ hai phương thức: **COD** và **VNPay**. Database, trang thanh toán, email và trang quản trị dùng cùng danh sách này.

Theo lựa chọn của chủ shop, đã thêm nút **Thử VNPay miễn phí** ở trang thanh toán và footer, dẫn tới demo chính thức: https://sandbox.vnpayment.vn/tryitnow/Home/CreateOrder

Đã thử thành công giao dịch mô phỏng 10.000đ, nội dung `Sun Cosmetic - Giao dich thu khong tru tien that`, mã đơn demo `321112`, mã giao dịch `15703027`, phản hồi `00`. Ảnh xác nhận: `C:\xampp\sun_cosmetic_work\vnpay-demo-success.jpg`.

Thẻ test chính thức: ngân hàng NCB, số thẻ `9704198526191432198`, tên `NGUYEN VAN A`, ngày phát hành `07/15`, OTP `123456`. Chỉ dùng trên sandbox.vnpayment.vn. Nguồn: https://sandbox.vnpayment.vn/apis/vnpay-demo/

Demo của VNPay là giao dịch mẫu của merchant VNPay Demo; không đánh dấu đơn Sun Cosmetic đã trả tiền. COD đang hoạt động cho đơn hàng của shop.

Khi có merchant test riêng, điền `VNPAY_TMN_CODE`, `VNPAY_HASH_SECRET`, `PUBLIC_URL` vào `config/thanh_toan.local.php` hoặc các biến môi trường cùng tên với tiền tố `SUN_`. Giữ `MODE=sandbox`. `PUBLIC_URL` cần URL HTTPS công khai để nhận IPN, vì VNPay không gọi được localhost từ máy chủ của họ. Đăng ký IPN `/payment/ipn/vnpay`; return `/payment/return/vnpay`. File chứa khóa được chặn HTTP và bỏ qua Git.

Phần tích hợp đã có ký HMAC SHA512, kiểm tra merchant và số tiền, cập nhật từ IPN trong transaction, chống callback lặp ghi đè trạng thái đã thanh toán. Không cập nhật đã trả tiền chỉ từ redirect trình duyệt.

## Gmail

Địa chỉ gửi, quản lý và nhận thông báo shop đều là `thaolnpt04102004@gmail.com`. Chưa có App Password của tài khoản này. Cấu hình `SUN_SMTP_PASS` hoặc điền App Password riêng trong `config/bi_mat.php` rồi khởi động lại Apache nếu dùng biến môi trường.

Khi chưa cấu hình SMTP, thư được lưu ở `C:\xampp\sun_cosmetic_work\storage\mail_outbox`, ngoài htdocs. Thư chưa được gửi tới Gmail. Dữ liệu thư thử đã được tách sang `qa_artifacts/mails`, không nằm trong hộp thư chờ của shop.

## Đăng nhập Google

Dự án Google Cloud riêng có tên **Sun Cosmetic**, Project ID `sun-cosmetic`, thuộc tài khoản Google đang quản lý dự án `thaolnp04102004@gmail.com`. Email quản lý website vẫn là `thaolnpt04102004@gmail.com`.

App name đã đặt là **Sun Cosmetic**. OAuth client `Sun Cosmetic - XAMPP` đã được tạo và kết nối, loại Web application, callback `http://localhost/sun_cosmetic/auth/googleCallback`. Đã kiểm tra trực tiếp trang Google hiển thị **to continue to Sun Cosmetic**.

Mã Google được lưu riêng ở `C:\xampp\sun_cosmetic_work\storage\google\client_secret.json`, ngoài thư mục web. Mã nguồn đọc file riêng này hoặc biến môi trường `SUN_GOOGLE_CLIENT_ID` và `SUN_GOOGLE_CLIENT_SECRET`. Nút Google đã bật; đăng nhập bằng email và mật khẩu vẫn dùng được.

13 kiểm tra khởi tạo OAuth, callback đúng/sai state, mã xác thực thiếu và người dùng từ chối đã đạt. PHP kết nối tới máy chủ đổi token Google với TLS được xác minh; mã thử không hợp lệ được Google từ chối như dự kiến. Ngày 13/10/2026, chủ shop đã tự hoàn tất đăng nhập bằng tài khoản Google thật và xác nhận thành công; Chrome quay về trang **Tài khoản của tôi — Sun Cosmetic** tại `/sun_cosmetic/account`.

OAuth hiện đăng ký callback localhost. Khi dùng tên miền HTTPS thật, cập nhật URL website và đăng ký callback tương ứng trong Google Cloud. Truy cập website qua IP nội bộ vẫn dùng được đăng nhập email/mật khẩu; callback IP nội bộ chưa đăng ký cho Google.

## Mã nguồn và đường dẫn

Thư mục đang chạy: `C:\xampp\htdocs\sun_cosmetic`. Tất cả URL nội bộ, form, ảnh, CSS, JavaScript và đường dẫn trả về thanh toán dùng tên mới. File nhập database duy nhất là `co_so_du_lieu/sun_cosmetic.sql`.

Các ảnh, logo, CSS theo ID sản phẩm và tiện ích sửa dữ liệu không còn dùng đã được đưa ra khỏi mã nguồn hoạt động. Bản chụp mã nguồn trước khi đổi tên được lưu riêng tại `C:\xampp\sun_cosmetic_work\source_before_full_sun_rename.zip`.

## Kiểm tra

41 kiểm tra luồng website/giỏ hàng/tài khoản/đặt hàng/CRUD quản trị và 11 kiểm tra chữ ký/callback thanh toán đã đạt. Tất cả file PHP đạt kiểm tra cú pháp. Đơn thử và người dùng thử đã được dọn, kho và lượt dùng mã được hoàn lại.

Sau khi thu gọn thanh toán, 14 kiểm tra lựa chọn phương thức/COD và 11 kiểm tra chữ ký/callback VNPay đã đạt. Đơn COD hiện có được giữ đầy đủ; các đơn thử mới đã được dọn. Quét 164 tệp mã nguồn và 71 trường văn bản trong database không tìm thấy tên thương hiệu hoặc nội dung sản phẩm cũ. 45 trang và 75 tài nguyên liên kết được kiểm tra không có lỗi; 18 lượt kiểm tra bố cục ở ba kích thước không tràn ngang.

Giao diện responsive được kiểm tra trực tiếp ở 1366px (màn hình lớn), 820px (tablet dọc), 1024px (tablet ngang), 390px và 320px (điện thoại). 31 lượt kiểm tra bố cục trang chủ, danh sách, chi tiết, giỏ hàng, thanh toán, liên hệ và tài khoản không phát hiện tràn ngang trang hoặc ô nhập liệu. Trang chủ hiển thị 4 / 3 / 2 cột sản phẩm theo màn hình lớn / tablet / điện thoại. Danh sách có 3 cột kèm bộ lọc bên trái trên màn hình lớn, 3 cột và bộ lọc thu gọn trên tablet, 2 cột trên điện thoại.

Menu và ô tìm kiếm được bố trí riêng trên tablet/điện thoại. Bộ lọc mở/đóng được; menu tài khoản dùng được bằng chạm. Menu di động hỗ trợ phím Escape, giữ focus trong menu và tự đóng khi chuyển sang bố cục màn hình lớn. Ô nhập liệu điện thoại dùng chữ 16px, nút mua hàng tối thiểu 44px. Ảnh kiểm tra và dữ liệu đo bố cục được lưu tại `C:\xampp\sun_cosmetic_work\responsive`.

Để mở từ điện thoại/tablet cùng mạng với máy XAMPP, dùng `http://<IP máy XAMPP>/sun_cosmetic/`. URL ảnh, liên kết và form tự dùng địa chỉ của máy chủ đang truy cập thay vì cố định localhost. Cần để Apache/MySQL đang chạy; không dùng `localhost` trên điện thoại vì địa chỉ đó trỏ về chính điện thoại. Khi đưa lên tên miền thật, cấu hình `SUN_SITE_URL` bằng URL chính thức của shop.

Địa chỉ Wi-Fi hiện tại của máy XAMPP: `http://10.115.15.4/sun_cosmetic/`. Đã kiểm tra trang và logo qua địa chỉ này trả về HTTP 200, liên kết và đường dẫn ảnh dùng đúng IP máy chủ. Địa chỉ này cần cập nhật nếu mạng cấp IP khác cho máy.

Nguồn ảnh sản phẩm: `ASSET_SOURCES.md`. Logo/banner và prompt: `DESIGN_ASSETS.md`.
