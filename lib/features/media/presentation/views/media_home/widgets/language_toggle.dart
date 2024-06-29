import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care_task/features/media/presentation/providers/app_language_provider/app_language_provider.dart';
import 'package:pet_care_task/main.dart';
import 'package:pet_care_task/util/resources/r.dart';

class LanguageToggleWidget extends ConsumerWidget {
  const LanguageToggleWidget({super.key});

  void _selectLanguage(BuildContext context, String code) {
    if (code == 'ar') {
      MyApp.of(context)!.setLocale(
        const Locale.fromSubtags(languageCode: 'en'),
      );
    } else {
      MyApp.of(context)!.setLocale(
        const Locale.fromSubtags(languageCode: 'ar'),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(appLanguageProvider);

    return GestureDetector(
      onTap: () {
        ref.read(appLanguageProvider.notifier).toggle();
        _selectLanguage(context, language);
      },
      child: Container(
        width: 80.w,
        height: 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: R.colors.navyBlue,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    language == 'en' ? 'AR' : 'EN',
                    style: TextStyle(
                      color: R.colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                  Text(
                    language == 'en' ? 'AR' : 'EN',
                    style: TextStyle(
                      color: R.colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedAlign(
              alignment: language == 'en'
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 40.w,
                height: 24.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: R.colors.white,
                ),
                alignment: Alignment.center,
                child: Text(
                  language.toUpperCase(),
                  style: TextStyle(
                    color: R.colors.navyBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
