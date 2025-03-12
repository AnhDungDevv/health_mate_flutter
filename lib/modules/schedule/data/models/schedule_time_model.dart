class ScheduleTime {
  final String startTime;
  final String endTime;

  ScheduleTime({
    required this.startTime,
    required this.endTime,
  });

  ScheduleTime copyWith({
    String? startTime,
    String? endTime,
  }) {
    return ScheduleTime(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime,
      'end_time': endTime,
    };
  }

  factory ScheduleTime.fromJson(Map<String, dynamic> json) {
    return ScheduleTime(
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
