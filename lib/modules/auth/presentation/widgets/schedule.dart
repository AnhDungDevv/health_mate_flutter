import 'package:flutter/material.dart';

class TimeSchedulerScreen extends StatefulWidget {
  const TimeSchedulerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TimeSchedulerScreenState();
}

class _TimeSchedulerScreenState extends State<TimeSchedulerScreen> {
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<bool> isSelected = [false, false, false, false, false, false, false];

  List<List<Map<String, String>>> timeSlots = List.generate(7, (_) => []);
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

  void addTime(int index) {
    setState(() {
      timeSlots[index].add({"start": "08:00 AM", "end": "09:00 PM"});
    });
  }

  void removeTimeDay(int dayIndex) {
    setState(() {
      timeSlots[dayIndex].clear();
    });
  }

  void removeTime(int dayIndex, int timeIndex) {
    setState(() {
      timeSlots[dayIndex].removeAt(timeIndex);
    });
  }

  final Map<String, bool> checkedDays = {};
  final Map<String, bool> isAddTime = {};
  final Map<String, String?> startTime = {};
  final Map<String, String?> endTime = {};

  @override
  void initState() {
    super.initState();
    for (var day in days) {
      checkedDays[day] = false;
      isAddTime[day] = false;
      startTime[day] = null;
      endTime[day] = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
          children: days.asMap().entries.map((entries) {
        return dayRow(entries.value, entries.key);
      }).toList()),
    );
  }

  Widget buildTimeRow(dayIndex, int timeIndex) {
    final isNewestItem = timeIndex == timeSlots[dayIndex].length - 1;

    return Row(
      spacing: 5,
      children: [
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButton<String>(
            value: startTimes.contains(timeSlots[dayIndex][timeIndex]["start"])
                ? timeSlots[dayIndex][timeIndex]["start"]
                : null, // Đảm bảo giá trị hợp lệ
            hint: const Text("Start time"),
            items: startTimes.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (value) {
              setState(() {
                timeSlots[dayIndex][timeIndex]["start"] = value!;
              });
            },
          ),
        ),
        Expanded(
          child: DropdownButton<String>(
            value: endTimes.contains(timeSlots[dayIndex][timeIndex]["end"])
                ? timeSlots[dayIndex][timeIndex]["end"]
                : null, // Đảm bảo giá trị hợp lệ
            hint: const Text("End time"),
            items: endTimes.map((item) {
              return DropdownMenuItem(value: item, child: Text(item));
            }).toList(),
            onChanged: (value) {
              setState(() {
                timeSlots[dayIndex][timeIndex]["end"] = value!;
              });
            },
          ),
        ),
        IconButton(
          icon: Icon(
            isNewestItem ? Icons.add : Icons.remove_circle,
            color: Colors.red,
          ),
          onPressed: isNewestItem
              ? () => addTime(dayIndex) // Thêm thời gian mới
              : () => removeTime(dayIndex, timeIndex), // Xóa thời gian
        ),
      ],
    );
  }

  Widget dayRow(String day, int index) {
    bool isEmptyTime = timeSlots[index].isEmpty ? true : false;
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
                  value: isSelected[index],
                  onChanged: (value) {
                    setState(() {
                      isSelected[index] = value!;
                      if (!value) timeSlots[index].clear();
                    });
                  }),
              Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (timeSlots[index].isEmpty)
              Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                    onPressed: isSelected[index]
                        ? () {
                            setState(() {
                              addTime(index);
                            });
                          }
                        : null,
                    child: Text(
                      'Add time',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  )),
            if (isSelected[index])
              Column(
                children: [
                  // for (int i = timeSlots[index].length - 1; i >= 0; i--)
                  //   buildTimeRow(index, i),
                  ...timeSlots[index]
                      .asMap()
                      .entries
                      .map((entry) => buildTimeRow(index, entry.key))
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
