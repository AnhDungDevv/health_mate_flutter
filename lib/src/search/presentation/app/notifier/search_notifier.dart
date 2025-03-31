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
  Timer? _debounceTimer; // Timer to handle debounce
  String _currentQuery = ''; // To store the current query

  // Method to perform the search
  Future<void> search(String query) async {
    // If query is empty, return empty data
    if (query.isEmpty) {
      state = const AsyncValue.data([]);
      return;
    }

    state = const AsyncValue.loading(); // Set the loading state
    try {
      final results =
          await useCase(query); // Call the use case to fetch results
      state = AsyncValue.data(results); // Update state with the fetched results
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current); // Handle errors
    }
  }

  // Method to update the query and apply debounce
  void updateSearchQuery(String query) {
    _currentQuery = query;

    // Cancel the previous debounce timer if it exists
    _debounceTimer?.cancel();

    // Start a new debounce timer
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // Only search if the query hasn't changed during the debounce period
      if (_currentQuery == query) {
        search(query); // Trigger search after the user stops typing
      }
    });
  }

  void clearQuery() {
    _currentQuery = '';
  }

  // Dispose the timer when no longer needed
  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }
}
