import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_care_task/common/extensions/size.dart';
import 'package:pet_care_task/features/media/domain/enums/media_type.dart';
import 'package:pet_care_task/features/media/domain/models/media_item/media_item_model.dart';
import 'package:pet_care_task/util/endpoints/endpoints.dart';
import 'package:pet_care_task/util/resources/r.dart';
import 'package:pet_care_task/util/router/paths.dart';

class MediaDetailsWidget extends StatelessWidget {
  const MediaDetailsWidget({required this.media, super.key});

  final MediaItemModel media;

  @override
  Widget build(BuildContext context) {
    final name = media.name ?? media.title;
    final type = MediaType.fromString(media.mediaType);

    final image = type.isPerson ? media.profilePath : media.posterPath;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: R.colors.navyBlue,
        centerTitle: true,
        iconTheme: IconThemeData(color: R.colors.white),
        title: Text(
          name!,
          style: TextStyle(
            color: R.colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                32.hb,
                InkWell(
                  borderRadius: BorderRadius.circular(12.r),
                  onTap: () {
                    GoRouter.of(context).push(
                      RoutePaths.imageView,
                      extra: '${Endpoints.imageBaseUrl}$image',
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: '${Endpoints.imageBaseUrl}$image',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                12.hb,
                Text(
                  media.overview,
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                12.hb,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
