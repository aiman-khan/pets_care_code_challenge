import 'package:injectable/injectable.dart';
import 'package:pet_care_task/features/media/domain/models/media_item/media_item_entity.dart';
import 'package:pet_care_task/features/media/domain/models/media_item/media_item_model.dart';
import 'package:pet_care_task/features/media/domain/repository/media_repository.dart';

import 'package:pet_care_task/infrastructure/usecase.dart';
import 'package:pet_care_task/infrastructure/usecase_input.dart';
import 'package:pet_care_task/infrastructure/usecase_output.dart';

class SearchMediaUsecaseInput extends Input {
  SearchMediaUsecaseInput({
    required this.bearerToken,
    required this.query,
    this.page,
  });

  final String bearerToken;
  final String query;
  final int? page;
}

class SearchMediaUsecaseOutput extends Output {
  SearchMediaUsecaseOutput({required List<MediaItemEntity> mediaItems})
      : _mediaItems = mediaItems;

  final List<MediaItemEntity> _mediaItems;

  List<MediaItemModel> get mediaItems =>
      _mediaItems.map(MediaItemModel.fromEntity).toList();
}

@lazySingleton
class SearchMediaUsecase
    extends Usecase<SearchMediaUsecaseInput, SearchMediaUsecaseOutput> {
  final MediaRepository _mediaRepository;

  SearchMediaUsecase({required MediaRepository mediaRepository})
      : _mediaRepository = mediaRepository;

  @override
  Future<SearchMediaUsecaseOutput> call(SearchMediaUsecaseInput input) async {
    return await _mediaRepository.searchMedia(input);
  }
}
