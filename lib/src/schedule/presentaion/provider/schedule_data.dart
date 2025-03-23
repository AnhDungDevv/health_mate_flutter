import 'package:health_mate/src/schedule/data/models/schedule_day_model.dart';
import 'package:health_mate/src/schedule/data/models/schedule_model.dart';

extension ScheduleModelExtension on ScheduleModel {
  ScheduleModel copyWith(
      {String? userId, bool? isEnabled, List<ScheduleDay>? schedule}) {
    return ScheduleModel(
      isEnabled: isEnabled ?? this.isEnabled,
      userId: userId ?? this.userId,
      schedule: schedule ?? [],
    );
  }
}
