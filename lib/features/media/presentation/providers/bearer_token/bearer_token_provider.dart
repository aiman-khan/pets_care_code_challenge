import 'package:flutter_riverpod/flutter_riverpod.dart';

final bearerTokenProvider = Provider<String>(
  (ref) {
    return 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZjZmNTcyNDBkY2E5NzE2ZDNiNDhmNWMwNjM1YjdhYiIsIm5iZiI6MTcxOTYwNjA2MC41NjcxOTEsInN1YiI6IjYyZmZiZDZlMDk3YzQ5MDA3ZjVmYzFlOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.K6bqOJJnrNaNRzL93auQgQcCMsHf_8xlpgbSxVxE8iY';
  },
);
