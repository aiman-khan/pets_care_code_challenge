class QueryModel {
  final String? query;
  final int? page;

  QueryModel({required this.query, this.page});

  factory QueryModel.initial() {
    return QueryModel(
      query: null,
      page: 1,
    );
  }

  QueryModel copyWith({
    String? query,
    int? page,
  }) {
    return QueryModel(
      query: query ?? query,
      page: page ?? page,
    );
  }
}
