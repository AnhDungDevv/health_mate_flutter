class Hash {
  static String formatPhoneNumber(String phoneNumber) {
    // Kiểm tra nếu số điện thoại hợp lệ
    if (phoneNumber.length >= 10) {
      // Lấy mã quốc gia + 2 chữ số đầu tiên
      String countryCode = phoneNumber.substring(0, 3); // "+99"
      String firstPart = "****"; // Phần đầu được thay bằng dấu "*"
      String lastPart = phoneNumber.substring(phoneNumber.length - 4); // 1234

      return "$countryCode$firstPart$lastPart";
    } else {
      return phoneNumber; // Trả về số điện thoại nếu không đủ dài
    }
  }
}
