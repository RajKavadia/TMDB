import 'package:flutter/cupertino.dart';

class Consts {
  static String api_key = "27a81224b941331f100fb86489f96d5f";

  static String base_url = "https://api.themoviedb.org/";

  static String getTopRatedMovies = "3/movie/top_rated?api_key=";

  static String getImageUrl = "http://image.tmdb.org/t/p/w500/";

  static String populerMovies = "/3/tv/popular?api_key=";

  static String SearchQuery = "/3/search/tv?api_key=";

  static String getLatest = "3/tv/latest?api_key=";

  static final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  var startmargin = const EdgeInsets.only(left: 10);

  static final upComingMovies = "/movie/upcoming?api_key=";
}

class Strings {
  static String TopTrending = 'Top Treanding Movies';

  static String see_all = "See all";

  static String Top_PopulerMovies = "Top Populer Movies";

  static String UpcomingMovies = "Top Upcoming Movies";
}
