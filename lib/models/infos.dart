class InfosDTO {
  bool locked;
  List<DateTime> history;

  InfosDTO({required this.locked, required this.history});

  Map<String, dynamic> toJson() {
    return {
      'locked': locked,
      'history': history.map((e) => e.millisecondsSinceEpoch),
    };
  }

  factory InfosDTO.fromJson(Map<String, dynamic> json) {
    return InfosDTO(
      locked: json['locked'] ?? false,
      history:
          json['history'].map((e) => DateTime.fromMillisecondsSinceEpoch(e)) ??
              [],
    );
  }
}
