import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/consultant/data/repository/category_repo_impl.dart';
import 'package:health_mate/src/consultant/data/source/category_remote_source.dart';
import 'package:health_mate/src/consultant/domain/repository/category_repo.dart';
import 'package:health_mate/src/consultant/domain/usecase/get_category.dart';
import 'package:health_mate/src/consultant/domain/usecase/post_selected_category.dart';

import 'package:health_mate/src/consultant/presentaion/app/notifier/category_notifier.dart';
import 'package:health_mate/src/consultant/presentaion/app/notifier/selected_category_notifier.dart';
import 'package:health_mate/src/consultant/presentaion/app/state/category_state.dart';

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
