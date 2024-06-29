import 'package:pet_care_task/features/media/domain/usecases/search_media_usecase.dart';
import 'package:pet_care_task/infrastructure/repository.dart';

abstract class MediaRemoteDataSource extends Repository {
  Future<SearchMediaUsecaseOutput> searchMedia(SearchMediaUsecaseInput input);
}
