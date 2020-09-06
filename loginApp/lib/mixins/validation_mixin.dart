class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a email !';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return "password < 6 char";
    }
    return null;
  }
}
