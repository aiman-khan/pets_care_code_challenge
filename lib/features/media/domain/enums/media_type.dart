enum MediaType {
  movie,
  tv,
  person;

  factory MediaType.fromString(String mediaType) {
    return switch (mediaType) {
      'movie' => MediaType.movie,
      'tv' => MediaType.tv,
      'person' => MediaType.person,
      _ => throw ArgumentError('Unknown media type: $mediaType')
    };
  }

  String get title {
    return switch (this) {
      MediaType.movie => "Movie",
      MediaType.tv => "TV",
      MediaType.person => "Person",
    };
  }

  String get name {
    return switch (this) {
      MediaType.movie => "movie",
      MediaType.tv => "tv",
      MediaType.person => "person",
    };
  }

  bool get isMovie => this == MediaType.movie;
  bool get isTV => this == MediaType.tv;
  bool get isPerson => this == MediaType.person;
}
