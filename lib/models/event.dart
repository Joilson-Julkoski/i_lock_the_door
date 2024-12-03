class EventDTO {
  final DateTime startTime;
  final DateTime endTime;
  final List<int> days;
  final String name;

  EventDTO(
      {required this.startTime,
      required this.endTime,
      required this.days,
      required this.name});

  Map<String, dynamic> toJson() {
    return {
      'startTime': startTime,
      'endTime': endTime,
      'days': days,
      'name': name,
    };
  }

  factory EventDTO.fromJson(Map<String, dynamic> json) {
    return EventDTO(
      startTime: DateTime.fromMillisecondsSinceEpoch(json['startTime']),
      endTime: DateTime.fromMillisecondsSinceEpoch(json['endTime']),
      days: json['days'],
      name: json['name'],
    );
  }
}
