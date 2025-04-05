import 'package:health_mate/src/payment/domain/repo/payment_repo.dart';

class ConfirmPaymentUsecase {
  final PaymentRepository repository;
  ConfirmPaymentUsecase(this.repository);

  Future<void> call(String paymentId) {
    return repository.confirmPayment(paymentId);
  }
}
