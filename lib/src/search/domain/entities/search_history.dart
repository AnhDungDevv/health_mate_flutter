import 'package:equatable/equatable.dart';

class SearchHistory extends Equatable {
  final String query;

  const SearchHistory({required this.query});

  @override
  List<Object> get props => [query];
}
