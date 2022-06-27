bool validatePassword(String value) {
  RegExp regex = RegExp(r'^[a-zA-Z0-9_]*$');
  if (value.length != 8) {
    return false;
  } else if (!regex.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}
