import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_care_task/features/media/domain/models/media_item/media_item_model.dart';
import 'package:pet_care_task/features/media/domain/usecases/search_media_usecase.dart';
import 'package:pet_care_task/features/media/presentation/providers/bearer_token/bearer_token_provider.dart';
import 'package:pet_care_task/features/media/presentation/providers/query/query_provider.dart';
import 'package:pet_care_task/util/di/di.dart';

final searchMediaProvider =
    FutureProvider.autoDispose<List<MediaItemModel>>((ref) async {
  final searchMedia = sl<SearchMediaUsecase>();

  final form = ref.read(queryProvider);
  final bearerToken = ref.read(bearerTokenProvider);

  final input = SearchMediaUsecaseInput(
    query: form.query!,
    bearerToken: bearerToken,
    page: form.page,
  );

  final output = await searchMedia(input);

  return output.mediaItems;
});
