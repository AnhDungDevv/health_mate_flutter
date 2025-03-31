import 'package:health_mate/src/search/domain/entities/search_history.dart';

class SearchHistoryModel extends SearchHistory {
  const SearchHistoryModel({required super.query});

  factory SearchHistoryModel.fromJson(Map<String, dynamic> json) =>
      SearchHistoryModel(query: json['query']);

  Map<String, dynamic> toJson() => {'query': query};
}
