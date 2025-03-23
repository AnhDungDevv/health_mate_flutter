import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/service_options/presentaion/widgets/service_item.dart';
import 'package:health_mate/src/service_options/service_provider.dart';

class SetServiceOption extends ConsumerStatefulWidget {
  const SetServiceOption({super.key});

  @override
  ConsumerState<SetServiceOption> createState() => _SetServiceOptionState();
}

class _SetServiceOptionState extends ConsumerState<SetServiceOption> {
  late Map<String, TextEditingController> controllers;
  late Map<String, double> localPrices;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final services = ref.read(serviceNotifierProvider);
    controllers = {
      for (var service in services)
        service.key: TextEditingController(text: service.price.toString())
    };
    localPrices = {for (var service in services) service.key: service.price};
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void saveChanges() {
    final serviceNotifier = ref.read(serviceNotifierProvider.notifier);
    localPrices.forEach((key, price) {
      serviceNotifier.updatePrice(key, price);
    });
  }

  @override
  Widget build(BuildContext context) {
    final services = ref.watch(serviceNotifierProvider);

    return Column(
      children: services.map((service) {
        return ServiceItem(
          title: service.name,
          price: localPrices[service.key] ?? service.price,
          enable: service.enabled,
          controller: controllers[service.key]!,
          onToggle: (value) {},
          onPriceChanged: (value) {
            setState(() {
              localPrices[service.key] =
                  double.tryParse(value) ?? service.price;
            });
          },
        );
      }).toList(),
    );
  }
}
