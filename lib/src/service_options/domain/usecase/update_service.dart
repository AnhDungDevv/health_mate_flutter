import 'package:health_mate/src/service_options/domain/entities/service_entity.dart';
import 'package:health_mate/src/service_options/domain/repository/service_repository.dart';

class UpdateServiceUseCase {
  final ServiceRepository repository;

  UpdateServiceUseCase({required this.repository});

  Future<void> call(String userId, ServiceEntity service) async {
    return await repository.updateService(userId, service);
  }
}
