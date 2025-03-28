import 'package:health_mate/src/service_options/domain/entities/service_entity.dart';
import 'package:health_mate/src/service_options/domain/repository/service_repository.dart';

class GetServiceUseCase {
  final ServiceRepository repository;

  GetServiceUseCase({required this.repository});

  Future<List<ServiceEntity>> call(String consultantId) async {
    return await repository.fetchService(consultantId);
  }
}
