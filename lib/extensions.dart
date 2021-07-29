extension DateTimeEx on DateTime {
  String get format =>
      '${this.hour}:${this.minute} ${this.timeZoneName}, ${this.day}/${this.month}/${this.year}';
}

extension StringEx on String {
  bool get isUrl => this.contains('https://') || this.contains('http://');
  bool get isEmail => this.contains('@');
}
