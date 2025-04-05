import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/payment/domain/entities/payment_entity.dart';
import 'package:health_mate/src/payment/domain/usecase/create_payment_usecase.dart';

class PaymentStateNotifier extends StateNotifier<AsyncValue<PaymentEntity>> {
  final CreatePaymentUsecase createPayment;

  PaymentStateNotifier({required this.createPayment})
      : super(const AsyncValue.loading());

  Future<void> createNewPayment(double amount, String method) async {
    state = const AsyncValue.loading();
    try {
      await createPayment(amount, method);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
