import 'package:health_mate/src/search/domain/repo/search_repository.dart';


class SearchConsultant {
  final SearchRepository repository;

  SearchConsultant(this.repository);

  Future<List<String>> call(String query) async {
    return await repository.searchConsultant(query);
  }
}
