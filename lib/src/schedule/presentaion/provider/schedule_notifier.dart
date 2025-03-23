import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/schedule/data/models/schedule_day_model.dart';
import 'package:health_mate/src/schedule/data/models/schedule_model.dart';
import 'package:health_mate/src/schedule/data/models/schedule_time_model.dart';

class ScheduleNotifier extends StateNotifier<ScheduleModel> {
  ScheduleNotifier() : super(_initializeSchedule());

  static ScheduleModel _initializeSchedule() {
    List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    return ScheduleModel(
      isEnabled: false,
      schedule: days
          .map((day) =>
              ScheduleDay(dayOfWeek: day, isEnabled: false, timeSlots: []))
          .toList(),
    );
  }

  /// **Bật chế độ hoạt động cho một ngày cụ thể**
  void enableDay(String day) {
    state = state.copyWith(
      schedule: state.schedule.map((d) {
        if (d.dayOfWeek == day) {
          return d.copyWith(isEnabled: !d.isEnabled);
        }
        return d;
      }).toList(),
      isEnabled: true,
    );
  }

  /// **Thêm một `timeSlot` vào ngày cụ thể**
  void addTimeSlot(String day) {
    state = state.copyWith(
      schedule: state.schedule.map((scheduleDay) {
        if (scheduleDay.dayOfWeek == day) {
          return scheduleDay.copyWith(
            timeSlots: [
              ...scheduleDay.timeSlots,
              ScheduleTime(startTime: "08:00 AM", endTime: "09:00 PM")
            ],
          );
        }
        return scheduleDay;
      }).toList(),
    );
  }

  void updateTimeSlot(String day, int index, {String? start, String? end}) {
    state = state.copyWith(
      schedule: state.schedule.map((scheduleDay) {
        if (scheduleDay.dayOfWeek == day) {
          List<ScheduleTime> updatedSlots = List.from(scheduleDay.timeSlots);
          if (index < updatedSlots.length) {
            updatedSlots[index] = updatedSlots[index].copyWith(
              startTime: start ?? updatedSlots[index].startTime,
              endTime: end ?? updatedSlots[index].endTime,
            );
          }
          return scheduleDay.copyWith(timeSlots: updatedSlots);
        }
        return scheduleDay;
      }).toList(),
    );
  }

  /// **Xóa một `timeSlot` theo index**
  void removeTimeSlot(String day, int index) {
    state = state.copyWith(
      schedule: state.schedule.map((scheduleDay) {
        if (scheduleDay.dayOfWeek == day) {
          List<ScheduleTime> updatedSlots = List.from(scheduleDay.timeSlots);
          if (index < updatedSlots.length) {
            updatedSlots.removeAt(index);
          }
          return scheduleDay.copyWith(timeSlots: updatedSlots);
        }
        return scheduleDay;
      }).toList(),
    );
  }

  void removeAllTimeOfDay(String day) {
    state = state.copyWith(
        schedule: state.schedule.map((scheduleDay) {
      if (scheduleDay.dayOfWeek == day) {
        return scheduleDay.copyWith(timeSlots: []);
      }
      return scheduleDay;
    }).toList());
  }

  /// **Cập nhật userId**
  void updateUserId(String userId) {
    state = state.copyWith(userId: userId);
  }
}
