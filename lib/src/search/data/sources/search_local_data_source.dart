import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/search_history_model.dart';

abstract class SearchLocalDataSource {
  Future<List<SearchHistoryModel>> getSearchHistory();
  Future<void> addSearchHistory(String query);
  Future<void> removeSearchHistory(String query);
  Future<void> clearSearchHistory();
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  final SharedPreferences prefs;

  SearchLocalDataSourceImpl(this.prefs);

  @override
  Future<List<SearchHistoryModel>> getSearchHistory() async {
    final jsonString = prefs.getStringList('search_history') ?? [];
    return jsonString
        .map((json) => SearchHistoryModel.fromJson(jsonDecode(json)))
        .toList();
  }

  @override
  Future<void> addSearchHistory(String query) async {
    final history = await getSearchHistory();
    if (history.any((item) => item.query == query)) return;
    history.insert(0, SearchHistoryModel(query: query));
    await prefs.setStringList(
        'search_history', history.map((e) => jsonEncode(e.toJson())).toList());
  }

  @override
  Future<void> removeSearchHistory(String query) async {
    final history = await getSearchHistory();
    history.removeWhere((item) => item.query == query);
    await prefs.setStringList(
        'search_history', history.map((e) => jsonEncode(e.toJson())).toList());
  }

  @override
  Future<void> clearSearchHistory() async {
    await prefs.remove('search_history');
  }
}
