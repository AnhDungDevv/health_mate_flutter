import 'package:health_mate/src/service_options/domain/entities/service_entity.dart';

abstract class ServiceRepository {
  Future<List<ServiceEntity>> fetchService(String userId);
  Future<void> updateService(String userId, ServiceEntity service);
}
