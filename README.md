# Shinn Cheat App (v2.0 Redesign)

Ứng dụng quản lý và phân phối các gói (package/tweak/repository) được thiết kế hoàn toàn mới với giao diện hiện đại, mượt mà và tối ưu hóa không gian hiển thị (khắc phục hoàn toàn lỗi lẹm viền dưới, bo góc tinh tế và hiệu ứng màu sắc sang trọng).

---

## 🚀 Tính năng chính

* **Trang chủ (Home):** 
  * Hiển thị trạng thái thiết bị kết nối (*Device Status: Connected*).
  * Hỗ trợ chọn nhanh vai trò đăng nhập (*Owner*, *Admin*, *Member*) với giao diện tương tác trực quan.
* **Danh mục gói (Sources):** 
  * Phân loại danh sách gói chi tiết (`Tất cả gói`, `AIM`, `ESP`, `Free Fire`, `Free Fire Max`, `MOD SKIN`,...).
  * Giao diện xem chi tiết từng gói và thao tác cài đặt nhanh.
* **Đã cài đặt (Installed):** Quản lý danh sách các gói đang được kích hoạt hoặc gỡ bỏ trên hệ thống.
* **Quản lý File (Files):** Truy cập và quản lý các thư mục cấu hình, file `dylib` hoặc payload hệ thống.
* **Công cụ hỗ trợ (More & Tools):**
  * Liên kết nhanh qua Telegram (`@ShinnThieuu`).
  * Hỗ trợ tính năng Donate (Sao chép nhanh số tài khoản MB Bank).
  * Đồng bộ dữ liệu từ Remote JSON repository.
  * Kiểm tra tính toàn vẹn file bằng SHA256.

---

## 🛠️ Hướng dẫn Build ứng dụng

1. **Yêu cầu hệ thống:** Đã cài đặt [Flutter SDK](https://flutter.dev/) và môi trường phát triển (Android Studio / VS Code / Xcode).
2. **Cấu hình Project:** 
   * Giữ nguyên mã nguồn file `main.dart` với toàn bộ mã giao diện chuẩn.
   * Cấu hình lại **Bundle ID** / **Package Name** trong file `pubspec.yaml`, `AndroidManifest.xml` hoặc `Info.plist` (trên Xcode) trùng khớp với định danh gói cũ của bạn.
3. **Chạy lệnh build:**
   ```bash
   # Chạy kiểm tra trên máy ảo / thiết bị thật
   flutter run

   # Build file cài đặt release cho Android (APK)
   flutter build apk --release

   # Build file cho iOS
   flutter build ios --release
