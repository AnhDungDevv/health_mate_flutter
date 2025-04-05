abstract class PaymentRepository {
  Future<void> createPayment(double amount, String method);
  Future<void> confirmPayment(String paymentId);
}
