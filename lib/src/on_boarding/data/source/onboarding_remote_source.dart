import 'package:dio/dio.dart';
import 'package:health_mate/core/error/exception.dart';
import 'package:health_mate/core/network/api_client.dart';
import '../models/onboarding_model.dart';

abstract class OnboardingRemoteSource {
  Future<OnboardingModel> fetchOnboardingData();
}

class OnboardingRemoteSourceImpl implements OnboardingRemoteSource {
  final Dio _dio = ApiClient().dio;

  OnboardingRemoteSourceImpl();

  @override
  Future<OnboardingModel> fetchOnboardingData() async {
    try {
      final response = await _dio.get("/onboarding");

      if (response.statusCode == 200) {
        return OnboardingModel.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException {
      rethrow;
    } catch (error) {
      throw ServerException("Unexpected error: $error");
    }
  }
}
