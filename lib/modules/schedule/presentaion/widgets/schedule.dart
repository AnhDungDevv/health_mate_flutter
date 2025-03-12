import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/schedule/data/models/schedule_day_model.dart';
import 'package:health_mate/modules/schedule/presentaion/provider/schedule_provider.dart';

class TimeSchedulerScreen extends ConsumerStatefulWidget {
  const TimeSchedulerScreen({super.key});

  @override
  _TimeSchedulerScreenState createState() => _TimeSchedulerScreenState();
}

class _TimeSchedulerScreenState extends ConsumerState<TimeSchedulerScreen> {
  @override
  Widget build(BuildContext context) {
    final scheduleState = ref.watch(scheduleProvider);

    return SizedBox(
      width: double.infinity,
      child: Column(
          children: scheduleState.schedule.asMap().entries.map((entries) {
        return dayRow(entries.value, entries.key);
      }).toList()),
    );
  }

  Widget buildTimeRow(
      ScheduleDay day, String startTime, String endTime, int indexTimeSlot) {
    final isOneTimeSlot =
        day.timeSlots.length - 1 == indexTimeSlot ? true : false;

    return Row(
      spacing: 5,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButton<String>(
            value: startTime,
            hint: const Text("Start time"),
            items: ref.watch(startTimeProvider).map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (value) {
              ref
                  .read(scheduleProvider.notifier)
                  .updateTimeSlot(day.dayOfWeek, indexTimeSlot, start: value);
            },
          ),
        ),
        Expanded(
          child: DropdownButton<String>(
            value: endTime,
            hint: const Text("End time"),
            items: ref.watch(endTimeProvider).map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (value) {
              ref
                  .read(scheduleProvider.notifier)
                  .updateTimeSlot(day.dayOfWeek, indexTimeSlot, end: value);
            },
          ),
        ),
        IconButton(
            icon: Icon(
              isOneTimeSlot ? Icons.add : Icons.remove_circle,
              color: Colors.red,
            ),
            onPressed: isOneTimeSlot
                ? () => ref
                    .read(scheduleProvider.notifier)
                    .addTimeSlot(day.dayOfWeek)
                : () => ref
                    .read(scheduleProvider.notifier)
                    .removeTimeSlot(day.dayOfWeek, indexTimeSlot)),
      ],
    );
  }

  Widget dayRow(ScheduleDay day, int index) {
    bool isEmptyTime = day.timeSlots.isEmpty ? true : false;
    return Row(
      spacing: isEmptyTime ? 40 : 10,
      crossAxisAlignment:
          isEmptyTime ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 100,
          child: Row(
            children: [
              Checkbox(
                  value: day.isEnabled,
                  onChanged: (value) {
                    if (day.isEnabled) {
                      ref
                          .read(scheduleProvider.notifier)
                          .removeAllTimeOfDay(day.dayOfWeek);
                    } else {
                      ref
                          .read(scheduleProvider.notifier)
                          .enableDay(day.dayOfWeek);
                    }
                  }),
              Text(day.dayOfWeek,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isEmptyTime)
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    onPressed: day.isEnabled
                        ? () {
                            ref
                                .read(scheduleProvider.notifier)
                                .addTimeSlot(day.dayOfWeek);
                          }
                        : null,
                    child: Text(
                      'Add time',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  )),
            if (day.isEnabled)
              Column(
                children: [
                  // for (int i = timeSlots[index].length - 1; i >= 0; i--)
                  //   buildTimeRow(index, i),
                  ...day.timeSlots
                      .asMap()
                      .entries
                      .map((entry) => buildTimeRow(day, entry.value.startTime,
                          entry.value.endTime, entry.key))
                      .toList()
                      .reversed,
                ],
              )
          ],
        )),
      ],
    );
  }
}
