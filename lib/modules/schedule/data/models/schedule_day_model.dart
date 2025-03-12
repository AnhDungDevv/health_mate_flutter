import 'package:health_mate/modules/schedule/data/models/schedule_time_model.dart';

class ScheduleDay {
  final bool isEnabled;
  final String dayOfWeek;
  final List<ScheduleTime> timeSlots;

  ScheduleDay({
    required this.dayOfWeek,
    required this.timeSlots,
    required this.isEnabled,
  });

  Map<String, dynamic> toJson() {
    return {
      'is_enabled': isEnabled,
      'day_of_week': dayOfWeek,
      'time_slots': timeSlots.map((e) => e.toJson()).toList(),
    };
  }

  factory ScheduleDay.fromJson(Map<String, dynamic> json) {
    return ScheduleDay(
      isEnabled: json['is_enabled'] as bool,
      dayOfWeek: json['day_of_week'] as String,
      timeSlots: (json['time_slots'] as List<dynamic>?)
              ?.map((e) => ScheduleTime.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
  ScheduleDay copyWith({
    String? dayOfWeek,
    List<ScheduleTime>? timeSlots,
    bool? isEnabled,
  }) {
    return ScheduleDay(
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      timeSlots: timeSlots ?? this.timeSlots,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
