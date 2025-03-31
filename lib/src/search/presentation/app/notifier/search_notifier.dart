import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/search/domain/usecase/search_consultant.dart';

class SearchNotifier extends StateNotifier<AsyncValue<List<String>>> {
  SearchNotifier(this.useCase) : super(const AsyncValue.loading());
  final SearchConsultant useCase;

  Future<void> search(String query) async {
    state = const AsyncValue.loading();
    try {
      final results = await useCase(query);
      state = AsyncValue.data(results);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
