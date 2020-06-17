# LEnglish

## Mô tả project: 
  - Xây dựng cở sở dữ liệu và website phục vụ cho việc học tiếng anh gồm kỹ năng nghe và đọc. Người dùng có thể vào web tạo tài khoản để làm bài tập và theo dõi bảng điểm cá nhân của mình. Quản trị viên có thể vào web để thêm các cấp bậc, danh mục, bài tập, câu hỏi cho website của mình.
  - Back-end: SQL Server Database, ADO.NET
  - Front-end: Angular framework

## Danh sách thành viên:
+ 1751010022 - Nguyễn Bá Đạt
+ 1751010026 - Đoàn Quí Đông
+ 1751010054 - Nguyễn Xuân Hưng
+ 1751010090 - Võ Văn Nhật Minh
+ 1751010083 - Đặng Quang Minh

## Phân công công việc:
### Back-end: 
 - Phân tích thiết kế cơ sở dữ liệu: Bá Đạt, Quí Đông, Nhật Minh, Xuân Hưng, Quang Minh
 - Tạo lược đồ cơ sở dữ liệu: Bá Đạt
 - Thêm dữ liệu cơ sở dữ liệu: Xuân Hưng, Quang Minh
 - Viết Store Produce: Quí Đông
 - Tạo project C# .NET core: Bá Đạt
 - Tạo APIController (Create, Update, Remove) cho các bảng dữ liệu: Bá Đạt
 - Tạo LinQ search cho các bảng (Có phân trang): Bá Đạt
 - Xử lý trang luyện nghe, luyện đọc (Hiện nội dung bài tập, tính và lưu điểm): Quí Đông, Bá Đạt
 - Xử lý đăng nhập, đăng kí (Có mã hóa mật khẩu): Bá Đạt
 - Xử lý chỉnh sửa thông tin, đổi mật khẩu người dùng: Bá Đạt
### Front-end:
 #### Người dùng: 
  - Giao diện trang chủ: Nhật Minh, Bá Đạt   
  - Giao diện trang luyện nghe, luyện đọc: Gồm 3 trang  
   - Level (Các cấp bậc): Quí Đông  
   - Lesson (Các bài tập của cấp bậc đó): Quí Đông
   - Content (Phần làm bài tập): Quí Đông, Bá Đạt 
  - Giao diện đăng nhập, đăng kí: Nhật Minh, Bá Đạt
  - Giao diện chỉnh sửa thông tin, đổi mật khẩu người dùng: Bá Đạt
  - Giao diện bảng điểm cá nhân của người dùng: Bá Đạt
  - Giao diện frame Dịch từ (Lấy Plugin Frame Tra Từ của dict.laban.vn): Bá Đạt 
 #### Quản trị viên: 
  - Giao diện thêm, sửa, xóa, tìm các bảng(CapBac, DanhMuc, BaiTap, CauHoi): Bá Đạt
## Hướng dẫn sử dụng:
 ### Cài đặt:
  - Cài SQL Server 2019 và chạy file script LEnglishDB.sql trong đường dẫn LEnglish\assets\Database
  - Cài Visual Studio 2019, hiệu chỉnh đường dẫn trong file LEnglishDBContext.cs và chạy project (Xem các API từ https://localhost:44318/swagger)
  - Cài Visual Studio Code (Hoặc editor khác), bật terminal chạy lần lượt các lệnh: npm install, ng build, ng s. Truy cập đường dẫn      http://localhost:4200 để vào web
  - Tạo tài khoản bằng cách click vào nút đăng nhập góc phải trên, click nút đăng kí và điền các thông tin cần thiết để tạo tài khoản
 ### Sử dụng phía quản trị viên: 
 #### Tài khoản quản trị viên (tài khoản gốc của website): Tên đăng nhập: admin / Mật khẩu: admin
  - Tại bảng cấp bậc: admin có thể thêm, sửa, xóa cấp bậc. Tìm kiếm cấp bậc theo tên hoặc mã
  - Tại bảng danh mục: admin có thể thêm, sửa, xóa danh mục. Tìm kiếm danh mục theo tên hoặc mã
  - Tại bảng bài tập: admin có thể thêm, sửa, xóa bài tập. Tìm kiếm bài tập theo tên hoặc mã. Nhấn nút Hiện nội dung để xem đầy đủ nội dung của bài tập đó
  - Tại bảng câu hỏi: admin có thể thêm, sửa, xóa bài tập. Tìm kiếm câu hỏi theo mã. Nhấn nút Hiện/Ẩn nội dung để bảng hiện đầy đủ thông tin câu hỏi
 ### Phía người dùng: 
 #### Tài khoản mẫu người dùng: Tên đăng nhập: xhung/ Mật khẩu: 123
  - Người dùng có thể tra cứu từ frame dịch tại trang chủ hoặc bấm nút dịch góc phải dưới
  - Vào các mục luyện nghe luyện đọc chọn bài tập và làm bài
  - Chỉnh sửa thông tin và đổi mật khẩu bằng nút tùy chỉnh
  - Xem thông tin bảng điểm các bài tập đã làm và chưa làm xong
 
