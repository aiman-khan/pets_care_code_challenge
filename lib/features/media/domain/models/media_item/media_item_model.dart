import 'package:pet_care_task/features/media/domain/models/media_item/media_item_entity.dart';

class MediaItemModel {
  final String? profilePath;
  final int id;
  final String? name;
  final String? title;
  final String overview;
  final String? posterPath;
  final String mediaType;

  MediaItemModel({
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.id,
    this.title,
    this.name,
    this.profilePath,
  });

  factory MediaItemModel.fromEntity(MediaItemEntity entity) {
    return MediaItemModel(
      mediaType: entity.mediaType,
      id: entity.id,
      name: entity.name,
      overview: entity.overview,
      posterPath: entity.posterPath,
      profilePath: entity.profilePath,
      title: entity.title,
    );
  }
}
