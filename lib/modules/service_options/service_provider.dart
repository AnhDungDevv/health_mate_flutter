import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/modules/service_options/data/repository/service_repository_impl.dart';
import 'package:health_mate/modules/service_options/data/source/service_remote_data_source.dart';
import 'package:health_mate/modules/service_options/domain/entities/service_entity.dart';
import 'package:health_mate/modules/service_options/domain/repository/service_repository.dart';
import 'package:health_mate/modules/service_options/domain/usecase/get_services.dart';
import 'package:health_mate/modules/service_options/domain/usecase/update_service.dart';
import 'package:health_mate/modules/service_options/presentaion/states/service_notifier.dart';

final serviceRemoteDataSource = Provider<ServiceRemoteDataSource>((ref) {
  return ServiceRemoteDataSourceImpl();
});

final serviceRepositoryProvider = Provider<ServiceRepository>((ref) {
  final remoteSource = ref.read(serviceRemoteDataSource);
  return ServiceRepositoryImpl(remoteDataSource: remoteSource);
});

final getServiceUsecase = Provider<GetServiceUseCase>((ref) {
  final serviceRepository = ref.read(serviceRepositoryProvider);
  return GetServiceUseCase(repository: serviceRepository);
});

final updateServiceUsecase = Provider<UpdateServiceUseCase>((ref) {
  final serviceRepository = ref.read(serviceRepositoryProvider);
  return UpdateServiceUseCase(repository: serviceRepository);
});

final serviceNotifierProvider =
    StateNotifierProvider<ServiceNotifier, List<ServiceEntity>>((ref) {
  final getService = ref.read(getServiceUsecase);
  final updateService = ref.read(updateServiceUsecase);
  return ServiceNotifier(getService, updateService);
});
