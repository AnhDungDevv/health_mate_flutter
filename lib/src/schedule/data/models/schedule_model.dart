import 'package:health_mate/src/schedule/data/models/schedule_day_model.dart';

class ScheduleModel {
  final String? userId;
  final bool isEnabled;
  final List<ScheduleDay> schedule;

  ScheduleModel({
    this.userId,
    required this.schedule,
    required this.isEnabled,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'is_enabled': isEnabled,
      'schedule': schedule.map((e) => e.toJson()).toList(),
    };
  }

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      userId: json['userId'],
      isEnabled: json['is_enabled'] as bool,
      schedule: (json['schedule'] as List)
          .map((e) => ScheduleDay.fromJson(e))
          .toList(),
    );
  }
  ScheduleModel copyWith({
    String? userId,
    bool? isEnabled,
    List<ScheduleDay>? schedule,
  }) {
    return ScheduleModel(
      userId: userId ?? this.userId,
      isEnabled: isEnabled ?? this.isEnabled,
      schedule: schedule ?? this.schedule,
    );
  }
}
