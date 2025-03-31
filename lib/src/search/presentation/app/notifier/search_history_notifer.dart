import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/search/domain/entities/search_history.dart';
import 'package:health_mate/src/search/domain/usecase/manage_search_history.dart';

class SearchHistoryNotifier extends StateNotifier<List<SearchHistory>> {
  final ManageSearchHistory useCase;

  SearchHistoryNotifier(this.useCase) : super([]) {
    loadHistory();
  }

  Future<void> loadHistory() async {
    state = await useCase.getHistory();
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
    state = [];
  }
}
