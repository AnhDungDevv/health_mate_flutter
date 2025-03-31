abstract class SearchRemoteDataSource {
  Future<List<String>> searchConsultant(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  @override
  Future<List<String>> searchConsultant(String query) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    return List.generate(10, (index) => 'Consultant $index for $query');
  }
}
