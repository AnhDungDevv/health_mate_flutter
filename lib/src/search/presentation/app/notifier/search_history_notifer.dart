import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/search/domain/usecase/manage_search_history.dart';

class SearchHistoryNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final ManageSearchHistoryUseCase useCase;

  SearchHistoryNotifier(this.useCase) : super(const AsyncValue.loading());
  Future<void> loadHistory() async {
    try {
      print('Loading search history...');
      final history = await useCase.getHistory();
      print('Search history loaded: $history');
      state = AsyncValue.data(history.isNotEmpty ? history : []);
      print('State updated to AsyncData');
    } catch (e) {
      print('Error loading search history: $e');
      state = AsyncValue.error(e, StackTrace.current);
      print('State updated to AsyncError');
    }
  }

  Future<void> addQuery(String query) async {
    await useCase.addQuery(query);
    loadHistory();
  }

  Future<void> removeQuery(String query) async {
    await useCase.removeQuery(query);
    loadHistory();
  }

  Future<void> clearAll() async {
    await useCase.clearAll();
    state = const AsyncValue.data([]);
  }
}
