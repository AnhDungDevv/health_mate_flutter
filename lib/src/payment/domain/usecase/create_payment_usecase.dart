import 'package:health_mate/src/payment/domain/repo/payment_repo.dart';

class CreatePaymentUsecase {
  final PaymentRepository repository;
  CreatePaymentUsecase(this.repository);

  Future<void> call(double amount, String method) {
    return repository.createPayment(amount, method);
  }
}
