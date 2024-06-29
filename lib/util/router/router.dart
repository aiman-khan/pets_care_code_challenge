import 'package:go_router/go_router.dart';
import 'package:pet_care_task/features/media/domain/models/media_item/media_item_model.dart';
import 'package:pet_care_task/features/media/presentation/views/media_home/media_home.dart';
import 'package:pet_care_task/features/media/presentation/views/media_home/widgets/media_details_widget.dart';
import 'package:pet_care_task/util/router/paths.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const MediaHome();
      },
    ),
    GoRoute(
      path: RoutePaths.mediaDetails,
      builder: (context, state) {
        final data = state.extra as MediaItemModel;
        return MediaDetailsWidget(media: data);
      },
    ),
  ],
);
