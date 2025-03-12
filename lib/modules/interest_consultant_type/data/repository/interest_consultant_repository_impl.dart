import 'package:health_mate/modules/interest_consultant_type/data/source/interest_consultant_remote_source.dart';
import 'package:health_mate/modules/interest_consultant_type/domain/entities/consultant_type_entity.dart';
import 'package:health_mate/modules/interest_consultant_type/domain/repository/interest_consultant_repository.dart';

class InterestConsultantRepositoryImpl implements InterestConsultantRepository {
  final InterestConsultantRemoteSource remoteSource;

  InterestConsultantRepositoryImpl(this.remoteSource);

  @override
  Future<List<ConsultantTypeEntity>> getInterestConsultants() async {
    return await remoteSource.fetchConsultantTypes();
  }
}
