bool validatePassword(String value) {
  RegExp regex = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  if (value.length < 8) {
    return false;
  } else if (regex.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}
