import 'package:health_mate/src/payment/data/sources/payment_remote_source.dart';
import 'package:health_mate/src/payment/domain/repo/payment_repo.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteSource remoteSource;

  PaymentRepositoryImpl(this.remoteSource);

  @override
  Future<void> createPayment(double amount, String method) async {
    return remoteSource.createPayment(amount, method);
  }

  @override
  Future<void> confirmPayment(String paymentId) async {
    return remoteSource.confirmPayment(paymentId);
  }
}
