extension NumExtension on double {
  String convertToPercentageString() {
    return '${(this * 10).toStringAsFixed(0)}%';
  }
}
