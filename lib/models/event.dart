class EventDTO {
  final DateTime time;
  final List<int> days;
  final String name;

  EventDTO(
      {required this.time,
      required this.days,
      required this.name});

  Map<String, dynamic> toJson() {
    return {
      'time': time.millisecondsSinceEpoch,
      'days': days,
      'name': name,
    };
  }

  factory EventDTO.fromJson(Map<String, dynamic> json) {
    return EventDTO(
      time: DateTime.fromMillisecondsSinceEpoch(json['time']),
      days: List<int>.from(json['days']),
      name: json['name'],
    );
  }
}
