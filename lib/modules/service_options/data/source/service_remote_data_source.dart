import 'package:dio/dio.dart';
import 'package:health_mate/core/error/error_handler.dart';
import 'package:health_mate/core/network/api_client.dart';
import 'package:health_mate/modules/service_options/data/model/service_option_model.dart';

abstract class ServiceRemoteDataSource {
  Future<List<ServiceModel>> fetchService(int consultantId);
  Future<void> updateService(int consultantId, ServiceModel service);
}

class ServiceRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final Dio _dio = ApiClient().dio;

  @override
  Future<List<ServiceModel>> fetchService(int consultantId) async {
    try {
      final response = await _dio.get('/services/$consultantId');
      final List<dynamic> data = response.data;

      if (data.isEmpty) {
        return _defaultServices();
      }

      return data.map((json) => ServiceModel.fromJson(json)).toList();
    } catch (error) {
      if (error is DioException && error.response?.statusCode == 404) {
        return _defaultServices();
      }
      throw ErrorHandler.handleError(error);
    }
  }

  @override
  Future<void> updateService(int consultantId, ServiceModel service) async {
    try {
      await _dio.put('/services/$consultantId/${service.id}',
          data: service.toJson());
    } catch (error) {
      throw ErrorHandler.handleError(error);
    }
  }

  List<ServiceModel> _defaultServices() {
    return [
      const ServiceModel(
          id: 1,
          name: "Audio Call",
          key: "audioCall",
          price: 0.0,
          enabled: false),
      const ServiceModel(
          id: 2,
          name: "Video Call",
          key: "videoCall",
          price: 0.0,
          enabled: false),
      const ServiceModel(
          id: 3, name: "Chat", key: "chat", price: 0.0, enabled: false),
    ];
  }
}
