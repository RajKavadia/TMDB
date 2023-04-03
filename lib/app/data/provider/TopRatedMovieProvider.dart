import 'package:raj_s_application9/app/models/topratedmovies.dart';

import '../repository/MovieProvider.dart';

class TopRatedMovieProvider{
  var topratedmovies;
  TopRatedMovieProvider(){
    getTopRatedMovies();
  }

  Future<void> getTopRatedMovies() async {
    topratedmovies = await MovieProvider().getTopRatedMovies();
  }
}