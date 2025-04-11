import 'package:flutter/material.dart';
import 'package:health_mate/src/consultant/domain/entities/appointment_entity.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentEntity entity;

  const AppointmentCard({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final icon = entity.isVideo ? Icons.videocam : Icons.mic;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, '/consultation-detail'); // Update as needed
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(entity.imageUrl),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(icon, size: 12, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(entity.name,
                            style: Theme.of(context).textTheme.titleMedium),
                        Text(entity.specialization),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 16, color: Colors.blue),
                    const SizedBox(width: 8),
                    Expanded(child: Text(entity.dateTime)),
                    Text(entity.duration),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
