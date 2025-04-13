# 📱 Social & Consultation App (Flutter Clean Architecture)

Ứng dụng mạng xã hội kết hợp hệ thống đặt lịch tư vấn chuyên gia, nhắn tin real-time, thanh toán và quản lý doanh thu – được phát triển với **Flutter** theo mô hình **Clean Architecture + Riverpod + REST API/WebSocket**.

---

## 🔥 Tính năng chính

### 1. 🧑‍🤝‍🧑 Mạng Xã Hội - Doing

- Đăng bài viết với ảnh và mô tả.
- Quản lý danh sách bài viết cá nhân.
- Theo dõi (Follow/Unfollow) người dùng khác.
- Tương tác với bài viết (like, comment, share).

### 2. 📅 Đặt Lịch & Tư Vấn - Doing

- Đặt lịch tư vấn 1-1 với chuyên gia.
- Gọi video/audio tư vấn (Agora) - .
- Quản lý lịch sử tư vấn.
- Tích hợp thanh toán trước buổi tư vấn.

### 3. 💵 Thanh Toán & Doanh Thu - Doing

- Quản lý giao dịch và hóa đơn.
- Theo dõi doanh thu của chuyên gia.
- Chức năng yêu cầu rút tiền về tài khoản ngân hàng.

### 4. 🔔 Thông Báo - Doing

- Nhận thông báo khi có lịch hẹn mới, follow, đánh giá...
- Thông báo được đồng bộ real-time với Firebase Cloud Messaging.

### 5. 💬 Chat Realtime - Done

- Nhắn tin 1-1 realtime bằng WebSocket.
- Hỗ trợ đa thiết bị.

---

## 🧱 Kiến trúc dự án

Dự án được tổ chức theo mô hình **Clean Architecture**, tách biệt rõ ràng giữa `data`, `domain`, và `presentation`:

```
lib/
├── core/
│   ├── config/
│   ├── constant/
│   ├── error_handle/
│   ├── functions/
│   ├── network/
│   ├── resources/
│   ├── routing/
│   ├── notification/
│   ├── storage/
│   ├── utils/
├── features/
│   ├── onboarding/
│   ├── auth/
│   ├── post/
│   ├── schedule/
│   ├── home/
│   ├── search/
│   ├── review/
│   ├── wallet/
│   ├── service_options/
│   ├── profile/
│   ├── consultation/
│   ├── chat/
│   ├── notification/
│       ├── data/
│       │   ├── model/
│       │   ├── source/
│       │   └── repo_impl/
│       ├── domain/
│       │   ├── entity/
│       │   ├── repository/
│       │   └── usecase/
│       └── presentation/
│           ├── provider/
│           └── ui/
```

---

## 🧰 Công nghệ sử dụng

- **Flutter**
- **Dart Freezed** (Sealed class & immutable data)
- **Riverpod** (State management)
- **REST API + WebSocket**
- **Firebase Messaging** (Push notification)
- **Agora SDK** (Video/audio call)
- **Dio** (HTTP client)
- **Flutter Secure Storage / SharedPreferences**
- **Flutter Local Notification**

---

## 🚀 Cài đặt và chạy dự án

```bash
git clone https://github.com/AnhDungDevv/health_mate_flutter.git
cd health_mate_flutter
flutter pub get
flutter run
```

---

## 🧪 Testing

```bash
flutter test
```

---
