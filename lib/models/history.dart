class HistoryDTO {
  DateTime time;
  bool locked;

  HistoryDTO({required this.locked, required this.time});

  Map<String, dynamic> toJson() {
    return {'locked': locked, 'time': time.millisecondsSinceEpoch};
  }

  factory HistoryDTO.fromJson(Map<String, dynamic> json) {
    return HistoryDTO(
        locked: json['locked'] ?? false,
        time: DateTime.fromMillisecondsSinceEpoch(json['time']));
  }
}
