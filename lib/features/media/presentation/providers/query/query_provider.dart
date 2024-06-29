import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_task/features/media/domain/models/query/query_model.dart';

class _QueryNotifier extends StateNotifier<QueryModel> {
  _QueryNotifier() : super(QueryModel(query: ''));

  void setQuery(String query) {
    state = state.copyWith(query: query);
  }

  void setPage(int page) {
    state = state.copyWith(page: page);
  }

  QueryModel get query => state;
}

final queryProvider = StateNotifierProvider<_QueryNotifier, QueryModel>(
  (ref) => _QueryNotifier(),
);
