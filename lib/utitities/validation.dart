class Validation {

  static String? isNotEmpty(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }

  static bool isValidEmail(String value) {
    final bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return emailValid;
  }

  static String? emailValidator(String? value) {
    String? result = isNotEmpty(value, 'Please enter an email');
    if (result == null) {
      if (!isValidEmail(value!)) {
        return 'pleas enter valid email';
      }
    }
    return result;
  }

  static String? phoneNumberValidator(String? value) {
    String? result = isNotEmpty(value, 'Please enter the phone number');

    RegExp regex = RegExp(r'^(?:\+20|20|0)?1[0125]\d{8}$');
    if (result == null) {
      if (!regex.hasMatch(value!)) {
        return 'Enter Valid Phone Number';
      }
    }
    return result;
  }

}
