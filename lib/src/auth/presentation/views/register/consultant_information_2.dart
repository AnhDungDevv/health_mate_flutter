import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:health_mate/src/schedule/presentaion/widgets/schedule.dart';
import 'package:health_mate/src/service_options/presentaion/widgets/set_service_option.dart';

class ConsultantInfoView2 extends ConsumerStatefulWidget {
  const ConsultantInfoView2({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ConsultantInfoScreenState();
}

class _ConsultantInfoScreenState extends ConsumerState<ConsultantInfoView2> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitchedSchedule = false;
  late Map<String, TextEditingController> controllers = {
    "youtube": TextEditingController(),
    "phone": TextEditingController(),
    "about": TextEditingController(),
    "referralCode": TextEditingController(),
  };
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    const SizedBox(height: 16),
                    // const SetExpertise(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Schedule',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Switch(
                          value: isSwitchedSchedule,
                          onChanged: (value) {
                            setState(() {
                              isSwitchedSchedule = value;
                            });
                          },
                          activeColor: Colors.white,
                          activeTrackColor: Colors.blue,
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                        )
                      ],
                    ),
                    const TimeSchedulerScreen(),
                    const SetServiceOption(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
