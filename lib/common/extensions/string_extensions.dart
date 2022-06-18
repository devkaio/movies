extension StringExtesion on String {
  String intelliTrim() {
    return length > 15 ? substring(0, 15) : this;
  }
}
