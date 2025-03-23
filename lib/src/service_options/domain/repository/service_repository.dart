import 'package:health_mate/src/service_options/domain/entities/service_entity.dart';

abstract class ServiceRepository {
  Future<List<ServiceEntity>> fetchService(int userId);
  Future<void> updateService(int userId, ServiceEntity service);
}
