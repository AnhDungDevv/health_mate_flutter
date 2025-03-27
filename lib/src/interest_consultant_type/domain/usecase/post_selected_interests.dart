import 'package:health_mate/src/interest_consultant_type/domain/repository/interest_consultant_repository.dart';

class PostSelectedInterestsUseCase {
  final InterestConsultantRepository _interestConsultantRepository;
  PostSelectedInterestsUseCase(this._interestConsultantRepository);

   Future<void> call(String userId, List<String> interests) async {
    return await _interestConsultantRepository.postSelectedInterests(userId, interests);
  }
}
