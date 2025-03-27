import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/interest_consultant_type/data/repository/interest_consultant_repository_impl.dart';
import 'package:health_mate/src/interest_consultant_type/data/source/interest_consultant_remote_source.dart';
import 'package:health_mate/src/interest_consultant_type/domain/repository/interest_consultant_repository.dart';
import 'package:health_mate/src/interest_consultant_type/domain/usecase/get_interest_consultants.dart';
import 'package:health_mate/src/interest_consultant_type/domain/usecase/post_selected_interests.dart';

import 'package:health_mate/src/interest_consultant_type/presentaion/app/notifier/interest_consultant_notifier.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/app/notifier/selected_interests_notifier.dart';
import 'package:health_mate/src/interest_consultant_type/presentaion/app/state/interest_consultant_state.dart';

final interestRemoteSourceProvider = Provider<InterestConsultantRemoteSource>(
    (ref) => InterestConsultantRemoteSource());

final interestRepositoryProvider = Provider<InterestConsultantRepository>(
    (ref) => InterestConsultantRepositoryImpl(
        ref.read(interestRemoteSourceProvider)));

final getInterestUseCaseProvider = Provider<GetInterestConsultantsUseCase>(
    (ref) =>
        GetInterestConsultantsUseCase(ref.read(interestRepositoryProvider)));

final postInterestUseCaseProvider = Provider<PostSelectedInterestsUseCase>(
    (ref) =>
        PostSelectedInterestsUseCase(ref.read(interestRepositoryProvider)));

final interestConsultantProvider =
    StateNotifierProvider<InterestConsultantNotifier, InterestConsultantState>(
  (ref) => InterestConsultantNotifier(ref.read(getInterestUseCaseProvider)),
);
final selectedInterestsProvider =
    StateNotifierProvider<SelectedInterestsNotifier, List<String>>(
  (ref) => SelectedInterestsNotifier(ref.read(postInterestUseCaseProvider)),
);
