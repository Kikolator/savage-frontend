class AddUserDataValidators {
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First name is required';
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last name is required';
    }
    return null;
  }

  static String? validateContactEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Contact email is required';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? validateContactPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^\+(?:[0-9] ?){6,14}[0-9]$').hasMatch(value)) {
      return 'Invalid phone number. Valid format +34 638 038 055';
    }
    return null;
  }

  static String? validatePhoneWhatsapp(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (value.isNotEmpty &&
        !RegExp(r'^\+(?:[0-9] ?){6,14}[0-9]$').hasMatch(value)) {
      return 'Invalid phone number. Valid format +34 638 038 055';
    }
    return null;
  }
}
