class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }

    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email) ? null : "Invalid email address";
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone number cannot be empty";
    }

    final regex = RegExp(r'^(0[3|5|7|8|9])([0-9]{8})$');
    return regex.hasMatch(phone) ? null : "Invalid phone number";
  }

  static String? validatePassword(String? password) {
    if (password!.trim().length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateReferralCode(String? value) {
    if (value != null && value.isNotEmpty && value.length < 6) {
      return 'Referral code should be at least 6 characters';
    }
    return null;
  }

  static String? notEmpty(String? value) {
    if (value != null && value.isNotEmpty && value.length < 6) {
      return 'Referral code should be at least 6 characters';
    }
    return null;
  }
}
