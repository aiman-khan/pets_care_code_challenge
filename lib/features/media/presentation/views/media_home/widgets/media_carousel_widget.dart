import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_care_task/common/extensions/size.dart';
import 'package:pet_care_task/features/media/domain/enums/media_type.dart';
import 'package:pet_care_task/features/media/presentation/providers/query/query_provider.dart';
import 'package:pet_care_task/features/media/presentation/providers/search_media/search_media_provider.dart';
import 'package:pet_care_task/util/endpoints/endpoints.dart';
import 'package:pet_care_task/util/resources/r.dart';
import 'package:pet_care_task/util/router/paths.dart';

class MediaCarouselWidget extends ConsumerWidget {
  const MediaCarouselWidget({required this.type, super.key});

  final MediaType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaAsync = ref.watch(searchMediaProvider);
    final query = ref.watch(queryProvider);

    if (query.query!.isEmpty) {
      return const SizedBox.shrink();
    }

    if (!mediaAsync.hasValue) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final mediaItems =
        mediaAsync.value?.where((e) => e.mediaType == type.name).toList() ?? [];

    return mediaItems.isEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type.title,
                style: TextStyle(
                  color: R.colors.navyBlue,
                  fontWeight: FontWeight.w700,
                  fontSize: 24.sp,
                ),
              ),
              12.hb,
              SizedBox(
                height: 240.h,
                child: CarouselSlider.builder(
                  itemCount: mediaItems.length,
                  options: CarouselOptions(viewportFraction: 0.55),
                  itemBuilder: (BuildContext context, int itemIndex, _) {
                    final media = mediaItems[itemIndex];
                    final name = media.name ?? media.title;

                    final image =
                        type.isPerson ? media.profilePath : media.posterPath;

                    return InkWell(
                      onTap: () => GoRouter.of(context).push(
                        RoutePaths.mediaDetails,
                        extra: media,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 180.h,
                              width: 164.w,
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
                            16.hb,
                            Text(
                              name ?? '',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}
