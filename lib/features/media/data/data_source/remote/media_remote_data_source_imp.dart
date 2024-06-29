import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pet_care_task/features/media/data/entities/media_type/rest_media_type.dart';
import 'package:pet_care_task/features/media/domain/data/data_source/remote/media_remote_data_source.dart';
import 'package:pet_care_task/features/media/domain/usecases/search_media_usecase.dart';
import 'package:pet_care_task/helpers/network_call_helper/network_call_helper.dart';
import 'package:pet_care_task/util/endpoints/endpoints.dart';
import 'package:pet_care_task/util/exceptions/message_exception.dart';

@LazySingleton(as: MediaRemoteDataSource)
class MediaRemoteDataSourceImp implements MediaRemoteDataSource {
  final Logger _logger;
  final NetworkCallHelper _networkCallHelper;

  MediaRemoteDataSourceImp({
    required Logger logger,
    required NetworkCallHelper networkCallHelper,
  })  : _logger = logger,
        _networkCallHelper = networkCallHelper;

  @override
  Future<SearchMediaUsecaseOutput> searchMedia(
      SearchMediaUsecaseInput input) async {
    try {
      _logger.i(input.bearerToken.toString());
      final response = await _networkCallHelper.get(
        Endpoints.searchMedia,
        params: {
          "api_key": 'df6f57240dca9716d3b48f5c0635b7ab',
          "query": input.query,
          "page": input.page,
        },
        headers: {
          'Authorization': input.bearerToken,
        },
      );

      _logger.i("Response: $response");

      if (response["success"] != null && !(response["success"] as bool)) {
        throw MessageException(message: response['message']);
      }

      final data =
          List<Map<String, dynamic>>.from(response['results'] as List<dynamic>);

      final mediaItems = data.map(RestMediaItemEntity.fromJson).toList();

      return SearchMediaUsecaseOutput(mediaItems: mediaItems);
    } on MessageException {
      rethrow;
    } catch (e) {
      _logger.e("SOMETHING WENT WRONG AT searchMedia: $e");
      throw SomethingWentWrongException();
    }
  }
}
