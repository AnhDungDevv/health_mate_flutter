import 'package:health_mate/src/search/domain/entities/consultant_search_res.dart';
import 'package:health_mate/src/search/domain/repo/search_repository.dart';

class SearchConsultant {
  final SearchRepository repository;

  SearchConsultant(this.repository);

  Future<List<ConsultantSearchRes>> call(String query) async {
    return await repository.searchConsultant(query);
  }
}
