import 'package:dio/dio.dart';
import 'package:health_mate/core/network/api_client.dart';

class PaymentRemoteSource {
  final Dio _dio = ApiClient().dio;
  Future<void> createPayment(double amount, String method) async {
    await _dio
        .post('/payment/create', data: {"amount": amount, "method": method});
  }

  Future<void> confirmPayment(String paymentId) async {
    await _dio.post('/payment/confirm', data: {"paymentId": paymentId});
  }
}
