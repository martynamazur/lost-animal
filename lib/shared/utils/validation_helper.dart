void safeCallIfNotEmpty(String? value, void Function(String) callback) {
  if (value != null && value.trim().isNotEmpty) {
    callback(value.trim());
  }
}
