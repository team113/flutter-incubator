extension DateTimeX on DateTime {
  String myFormat() =>
      "${year.toString().padLeft(4, '0')}"
      ".${month.toString().padLeft(2, '0')}"
      ".${day.toString().padLeft(2, '0')} "
      "${hour.toString().padLeft(2, '0')}:"
      "${minute.toString().padLeft(2, '0')}:"
      "${second.toString().padLeft(2, '0')}";
}

void main() {
  // Implement an extension on [DateTime], returning a [String] in format of
  // `YYYY.MM.DD hh:mm:ss` (e.g. `2023.01.01 00:00:00`).

  final now = DateTime.now();
  /// Normally DateTime gives
  print(now.toString()); // Example: 2025-09-03 15:51:25.749801
  /// Using custome extension DateTime gives
  print(now.myFormat()); // Example: 2025.09.03 15:51:25
}
