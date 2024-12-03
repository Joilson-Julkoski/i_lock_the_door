import 'package:i_lock_the_door/models/history.dart';

class InfosDTO {
  bool locked;
  List<HistoryDTO> history;

  InfosDTO({required this.locked, required this.history});

  Map<String, dynamic> toJson() {
    return {
      'locked': locked,
      'history': history.map((e) => e.toJson()),
    };
  }

  factory InfosDTO.fromJson(Map<String, dynamic> json) {
    return InfosDTO(
      locked: json['locked'] ?? false,
      history: json['history'].map((e) => HistoryDTO.fromJson(e)) ?? [],
    );
  }
}
