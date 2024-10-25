class AppValidetor {
  // Text Validetor
  static textValidetor(String? value, String text) {
    if (value == null || value.isEmpty) {
      return "Please Enter $text";
    } else
      return null;
  }

  // Email Validetor
  static emailValidetor(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter email";
    } else if (!value.endsWith("@gmail.com")) {
      return "Please Enter a valide email";
    } else {
      return null;
    }
  }

  // Password Validetor
  static passwordValidetor(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter password";
    } else if (value.length < 4) {
      return "Please Enter 4 digt password";
    } else {
      return null;
    }
  }
}
