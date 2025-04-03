import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_mate/core/common/styles/colors.dart';
import 'package:health_mate/src/auth/presentation/widgets/custom_input_field.dart';

final selectedAmountProvider = StateProvider<String>((ref) => "20");
final selectedPaymentMethodProvider =
    StateProvider<String>((ref) => "Google Pay");

class AddFundsView extends ConsumerWidget {
  const AddFundsView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> amounts = ["10", "20", "50", "100", "200"];
    final List<Map<String, dynamic>> paymentMethods = [
      {"name": "Paypal", "icon": FontAwesomeIcons.paypal},
      {"name": "Google Pay", "icon": FontAwesomeIcons.googlePay},
      {"name": "Credit or Debit Card", "icon": FontAwesomeIcons.creditCard},
    ];
    final selectedAmount = ref.watch(selectedAmountProvider);
    final selectedPaymentMethod = ref.watch(selectedPaymentMethodProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add funds'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Choose Amount Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Choose Amount',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              CustomInputField(
                inputDecoration: InputDecoration(
                  hintText: '\$$selectedAmount',
                  hintStyle: const TextStyle(color: Colors.black87),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: amounts.length,
                  itemBuilder: (context, index) {
                    final amount = amounts[index];
                    final bool isSelected = selectedAmount == amount;

                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedAmountProvider.notifier).state =
                            amount;
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 50.w,
                        height: 30.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 1),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue[100]
                              : Theme.of(context).colorScheme.tertiaryContainer,
                          borderRadius: BorderRadius.circular(1),
                          border: Border.all(
                            color:
                                isSelected ? Colors.blue : Colors.transparent,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '\$$amount',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.blue : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Select Payment Method Section
              const Row(
                children: [
                  Text(
                    'Select Payment Method',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: paymentMethods.length,
                  itemBuilder: (context, index) {
                    final method = paymentMethods[index];
                    final isSelected = selectedPaymentMethod == method['name'];
                    return GestureDetector(
                      onTap: () {
                        ref
                                .read(selectedPaymentMethodProvider.notifier)
                                .state ==
                            method['name'];
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 1),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue[50]
                              : Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            width: 2,
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.white,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: method['name'],
                                    activeColor: isSelected
                                        ? Theme.of(context).colorScheme.primary
                                        : null,
                                    groupValue: selectedPaymentMethod,
                                    onChanged: (value) {
                                      ref
                                          .read(selectedPaymentMethodProvider
                                              .notifier)
                                          .state = value!;
                                    }),
                                Text(
                                  method["name"]!,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                            FaIcon(
                              method["icon"],
                              size: 24,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity, // Full width of the screen
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: Text(
                    'Continue to add \$$selectedAmount',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
