import 'package:flutter/material.dart';

class Endpoints {
  Endpoints._();

  static const imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static const searchMedia = 'https://api.themoviedb.org/3/search/multi';
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
