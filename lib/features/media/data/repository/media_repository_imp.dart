import 'package:injectable/injectable.dart';
import 'package:pet_care_task/features/media/domain/data/data_source/remote/media_remote_data_source.dart';
import 'package:pet_care_task/features/media/domain/repository/media_repository.dart';
import 'package:pet_care_task/features/media/domain/usecases/search_media_usecase.dart';

@LazySingleton(as: MediaRepository)
class MediaRepositoryImp implements MediaRepository {
  final MediaRemoteDataSource _mediaRemoteDataSource;

  MediaRepositoryImp({
    required MediaRemoteDataSource authRemoteDataSource,
  }) : _mediaRemoteDataSource = authRemoteDataSource;

  @override
  Future<SearchMediaUsecaseOutput> searchMedia(SearchMediaUsecaseInput input) {
    return _mediaRemoteDataSource.searchMedia(input);
  }
}
