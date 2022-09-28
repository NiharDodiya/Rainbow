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

bool hasValidUrl(String value) {
  String pattern =
      r'[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  } else if (regExp.hasMatch(value)) {
    return true;
  }
  return false;
}
