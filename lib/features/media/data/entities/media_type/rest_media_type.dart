import 'package:pet_care_task/features/media/domain/models/media_item/media_item_entity.dart';

class RestMediaItemEntity implements MediaItemEntity {
  @override
  final int id;
  @override
  final String? name;
  @override
  final String? title;
  @override
  final String overview;
  @override
  final String posterPath;
  @override
  final String mediaType;
  @override
  final String? profilePath;

  RestMediaItemEntity({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.title,
    required this.profilePath,
  });

  factory RestMediaItemEntity.fromJson(Map<String, dynamic> json) {
    return RestMediaItemEntity(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      mediaType: json['media_type'] ?? '',
      profilePath: json['profile_path'],
    );
  }
}
