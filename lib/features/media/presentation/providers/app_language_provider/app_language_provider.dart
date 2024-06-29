import 'package:flutter_riverpod/flutter_riverpod.dart';

class _AppLanguageNotifier extends StateNotifier<String> {
  _AppLanguageNotifier() : super('en');

  void toggle() {
    if (state == 'en') {
      state = 'ar';
    } else {
      state = 'en';
    }
  }

  String get language => state;
}

final appLanguageProvider = StateNotifierProvider<_AppLanguageNotifier, String>(
  (ref) => _AppLanguageNotifier(),
);
