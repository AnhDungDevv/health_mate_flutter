import 'package:health_mate/src/consultant/domain/repository/category_repo.dart';

class PostSelectedInterestsUseCase {
  final InterestConsultantRepository _interestConsultantRepository;
  PostSelectedInterestsUseCase(this._interestConsultantRepository);

   Future<void> call(String userId, List<String> interests) async {
    return await _interestConsultantRepository.postSelectedInterests(userId, interests);
  }
}
