abstract class MediaItemEntity {
  final String? profilePath;
  final int id;
  final String? name;
  final String? title;
  final String overview;
  final String? posterPath;
  final String mediaType;

  MediaItemEntity({
    required this.id,
    required this.title,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    this.profilePath,
  });
}
