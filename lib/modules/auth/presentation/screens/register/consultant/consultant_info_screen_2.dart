import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_mate/modules/auth/presentation/widgets/custom_input_field.dart';
import 'package:health_mate/modules/auth/presentation/widgets/schedule.dart';

class ConsultantInfoScreen2 extends StatefulWidget {
  const ConsultantInfoScreen2({super.key});

  @override
  State<ConsultantInfoScreen2> createState() => _ConsultantInfoScreenState();
}

class _ConsultantInfoScreenState extends State<ConsultantInfoScreen2> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitchedSchedule = false;
  late Map<String, TextEditingController> controllers = {
    "category": TextEditingController(),
    "youtube": TextEditingController(),
    "phone": TextEditingController(),
    "about": TextEditingController(),
    "referralCode": TextEditingController(),
    "audioCall": TextEditingController(),
    "videoCall": TextEditingController(),
    "chat": TextEditingController(),
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // print("Form is valid! Submitting data...");
    } else {
      // print("Form is not valid");
    }
  }

  List<Map<String, dynamic>> services = [
    {
      "name": "Audio Call (per min)",
      "key": "audioCall",
      "price": 20,
      "enabled": true
    },
    {
      "name": "Video Call (per min)",
      "key": "videoCall",
      "price": 20,
      "enabled": true
    },
    {"name": "Chat (per session)", "key": "chat", "price": 20, "enabled": true}
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Thêm padding để tránh sát lề
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  const SizedBox(height: 16), // Thêm khoảng cách cho đẹp
                  const Text(
                    'Set your expertise',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  CustomInputField(
                    label: 'Category',
                    hintText: 'e.g. Doctor',
                    controller: controllers["category"]!,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Name is required'
                        : null,
                  ),
                  CustomInputField(
                    label: 'Introduction Video',
                    hintText: 'Paste YouTube link here',
                    controller: controllers["youtube"]!,
                    keyboardType: TextInputType.url,
                    validator: (value) => null,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Identity Proof',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
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

                  Column(
                    children: services.map((service) {
                      return ServiceItem(
                        title: service['name'],
                        controller: controllers[service['key']]!,
                        enable: service['enabled'],
                        price: service['price'],
                        onToggle: (value) {
                          setState(() => service['enabled'] = value);
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () => _submitForm(),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  final String title;
  final int price;
  final bool enable;
  final ValueChanged<bool> onToggle;
  final TextEditingController controller;
  const ServiceItem(
      {super.key,
      required this.title,
      required this.price,
      required this.enable,
      required this.onToggle,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Switch(value: enable, onChanged: (value) => onToggle(value))
          ],
        ),
        const SizedBox(height: 4),
        CustomInputField(
            label: 'Set price',
            hintText: '\$ $price',
            prefixText: '\$',
            controller: controller),
      ],
    );
  }
}
