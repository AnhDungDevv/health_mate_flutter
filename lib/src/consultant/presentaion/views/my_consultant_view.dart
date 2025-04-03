import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/core/routing/routes_name.dart';
import 'package:health_mate/src/search/presentation/widgets/search_input.dart';

class MyConsultantView extends ConsumerStatefulWidget {
  const MyConsultantView({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MyConsultantViewState();
  }
}

class _MyConsultantViewState extends ConsumerState<MyConsultantView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Consult',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            spacing: 15,
            children: [
              const SearchInput(),
              Column(
                children: [
                  AppointmentCard(
                    name: 'Dr. John Smith',
                    specialization: 'Clinical Physchologist',
                    dateTime: 'Monday, 16 Aug 2023 | 13:45 PM',
                    duration: '15 mins',
                    imageUrl: 'assets/images/user_consultant/1.png',
                    icon: Icons.mic,
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.consultantionDetailView);
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AppointmentCard(
                    icon: Icons.videocam,
                    name: 'Dr. John Smith',
                    specialization: 'Clinical Physchologist',
                    dateTime: 'Monday, 16 Aug 2023 | 13:45 PM',
                    duration: '5 mins',
                    imageUrl: 'assets/images/user_consultant/1.png',
                    onTap: () {
                      Navigator.pushNamed(
                          context, RoutesName.consultantionDetailView);
                    }, // Replace with actual image URL
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String dateTime;
  final String duration;
  final String imageUrl;
  final IconData icon;
  final VoidCallback onTap;

  const AppointmentCard(
      {super.key,
      required this.name,
      required this.specialization,
      required this.dateTime,
      required this.duration,
      required this.imageUrl,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: Theme.of(context)
                    .colorScheme
                    .outline
                    .withAlpha((0.2 * 255).toInt()),
                width: 1)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 16,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(imageUrl),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 19,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.secondary,
                                borderRadius: BorderRadius.circular(50)),
                            height: 19,
                            alignment: Alignment.center, // Căn giữa icon
                            child: Icon(
                              icon,
                              size: 12,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                        const SizedBox(height: 4),
                        Text(specialization,
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dateTime,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
