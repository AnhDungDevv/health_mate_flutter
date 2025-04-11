import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/consultant/presentaion/app/provider/my_consultation_providers.dart';
import 'package:health_mate/src/consultant/presentaion/widgets/appointment_card.dart';

class MyConsultantView extends ConsumerWidget {
  const MyConsultantView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myConsultationNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Consult',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: state.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Text(e.toString()),
          data: (appointments) => ListView.separated(
            itemCount: appointments.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (_, index) =>
                AppointmentCard(entity: appointments[index]),
          ),
        ),
      ),
    );
  }
}
