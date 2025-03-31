import 'package:health_mate/core/storage/prefs_storage_service.dart';

abstract class SearchLocalDataSource {
  Future<List<String>>
      getSearchHistory(); // Save search history (list of keywords)
  Future<void> addSearchHistory(String query); // Add a query to the history
  Future<void> removeSearchHistory(
      String query); // Remove a query from the history
  Future<void> clearSearchHistory(); // Clear all search history
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final PrefsStorageService _prefsStorage = PrefsStorageService.instance;

  // @override
  // Future<List<String>> getSearchHistory() async {
  //   if (!(await _prefsStorage.containsKey('search_history'))) {
  //     return []; // Return an empty list if there's no history
  //   }

  //   // Retrieve the list of stored search keywords
  //   final List<String> jsonStringList =
  //       (await _prefsStorage.getStringList('search_history'))?.cast<String>() ??
  //           [];

  //   return jsonStringList; // Return the list of search keywords
  // }
  @override
  Future<List<String>> getSearchHistory() async {
    // Fake data for testing purposes
    return [
      'english tutor',
      'chest doctor',
      'criminal lawyer',
      'top marketer',
      'software engineer',
      'personal trainer',
      'nutritionist',
      'graphic designer',
      'financial advisor',
      'career coach',
    ];
  }

  @override
  Future<void> addSearchHistory(String query) async {
    final history = await getSearchHistory();

    if (history.contains(query)) {
      history.remove(query); // Move the existing query to the top
    }

    history.insert(0, query);

    // Limit the history size to 10 items
    if (history.length > 10) {
      history.removeLast();
    }

    await _prefsStorage.setStringList(
      'search_history',
      history,
    );
  }

  @override
  Future<void> removeSearchHistory(String query) async {
    final history = await getSearchHistory();

    // Remove the query from the search history
    history.remove(query);

    // Save the updated list back to SharedPreferences
    await _prefsStorage.setStringList(
      'search_history',
      history,
    );
  }

  @override
  Future<void> clearSearchHistory() async {
    // Clear the entire search history
    await _prefsStorage.delete('search_history');
  }
}
