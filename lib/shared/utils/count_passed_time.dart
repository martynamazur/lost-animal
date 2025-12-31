String formatElapsedTime(DateTime dateTime) {
  final Duration diff = DateTime.now().difference(dateTime);

  if (diff.inSeconds < 60) {
    return '${diff.inSeconds}s';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes}m';
  } else if (diff.inHours < 24) {
    return '${diff.inHours}h';
  } else if (diff.inDays < 7) {
    return '${diff.inDays}d';
  } else if (diff.inDays < 30) {
    final weeks = (diff.inDays / 7).floor();
    return '$weeks weeks.';
  } else if (diff.inDays < 365) {
    final months = (diff.inDays / 30).floor();
    return '$months months.';
  } else {
    final years = (diff.inDays / 365).floor();
    return '$years y.';
  }
}
