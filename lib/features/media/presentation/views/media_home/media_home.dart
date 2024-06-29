import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care_task/common/extensions/size.dart';
import 'package:pet_care_task/features/media/domain/enums/media_type.dart';
import 'package:pet_care_task/features/media/presentation/providers/query/query_provider.dart';
import 'package:pet_care_task/features/media/presentation/providers/search_media/search_media_provider.dart';
import 'package:pet_care_task/features/media/presentation/views/media_home/widgets/media_carousel_widget.dart';
import 'package:pet_care_task/util/resources/r.dart';

class MediaHome extends ConsumerWidget {
  const MediaHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: R.colors.navyBlue,
        centerTitle: true,
        title: Text(
          'TMDB',
          style: TextStyle(
            color: R.colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              24.hb,

              /// [ Search Bar ]
              TextField(
                onChanged: (v) {
                  ref.read(queryProvider.notifier).setQuery(v);
                  ref.invalidate(searchMediaProvider);
                },
                decoration: InputDecoration(
                  hintText: 'Search Movies',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),

              32.hb,

              /// [ Movie Carousel  ]
              const MediaCarouselWidget(type: MediaType.movie),

              24.hb,

              /// [ TV Carousel  ]
              const MediaCarouselWidget(type: MediaType.tv),

              24.hb,

              /// [ Person Carousel ]
              const MediaCarouselWidget(type: MediaType.person),

              12.hb,
            ],
          ),
        ),
      ),
    );
  }
}
