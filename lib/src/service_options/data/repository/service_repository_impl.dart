import 'package:health_mate/src/service_options/data/model/service_option_model.dart';
import 'package:health_mate/src/service_options/data/source/service_remote_data_source.dart';
import 'package:health_mate/src/service_options/domain/entities/service_entity.dart';
import 'package:health_mate/src/service_options/domain/repository/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource remoteDataSource;

  ServiceRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ServiceEntity>> fetchService(int userId) async {
    final List<ServiceModel> serviceModels =
        await remoteDataSource.fetchService(userId);

    return serviceModels
        .map((serviceModel) => ServiceEntity(
              id: serviceModel.id,
              name: serviceModel.name,
              key: serviceModel.key,
              price: serviceModel.price,
              enabled: serviceModel.enabled,
            ))
        .toList();
  }

  @override
  Future<void> updateService(int userId, ServiceEntity service) async {
    final serviceModel = ServiceModel(
      id: service.id,
      name: service.name,
      key: service.key,
      price: service.price,
      enabled: service.enabled,
    );

    await remoteDataSource.updateService(userId, serviceModel);
  }
}
