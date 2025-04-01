import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_mate/src/search/domain/entities/consultant_search_res.dart';
import 'package:health_mate/src/search/domain/usecase/search_consultant.dart';

class SearchNotifier
    extends StateNotifier<AsyncValue<List<ConsultantSearchRes>>> {
  SearchNotifier(this.useCase) : super(const AsyncValue.loading()) {
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {});
  }

  final SearchConsultant useCase;
  Timer? _debounceTimer;
  String _currentQuery = '';
  int _lastSearchRequest = 0; // Track the latest search request ID

  Future<void> search(String query) async {
    // If the query is empty, return an empty result
    if (query.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }

    final int requestId =
        ++_lastSearchRequest; // Create a new ID for the current request

    try {
      // Call api
      final results = await useCase(query);
      // Ignore stale responses if they are not from the latest request
      if (requestId != _lastSearchRequest) {
        return;
      }

      state = AsyncValue.data(results);
    } catch (e) {
      if (requestId == _lastSearchRequest) {
        state = AsyncValue.error(
            "Some error! Please try again", StackTrace.current);
      }
    }
  }

  void updateSearchQuery(String query) {
    _currentQuery = query;
    state = const AsyncValue.loading();
    _debounceTimer?.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // Ensure the query is still the same and not empty before searching
      if (_currentQuery == query && query.isNotEmpty) {
        search(query);
      }
    });
  }

  void clearQuery() {
    _currentQuery = '';
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
