import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/schedule/data/models/schedule_model.dart';
import 'package:health_mate/src/schedule/presentaion/provider/schedule_notifier.dart';

final scheduleProvider =
    StateNotifierProvider<ScheduleNotifier, ScheduleModel>((ref) {
  return ScheduleNotifier();
});
final startTimeProvider = Provider((ref) => startTimes);
final endTimeProvider = Provider((ref) => endTimes);
final List<String> startTimes = [
  "08:00 AM",
  "09:00 AM",
  "10:00 AM",
  "11:00 AM",
];
final List<String> endTimes = [
  "12:00 PM",
  "01:00 PM",
  "02:00 PM",
  "03:00 PM",
  "04:00 PM",
  "05:00 PM",
  "06:00 PM",
  "07:00 PM",
  "08:00 PM",
  "09:00 PM"
];
