import 'dart:convert';

import 'package:get/get.dart';
import 'package:raj_s_application9/app/data/repository/MovieProvider.dart';
import 'package:raj_s_application9/app/models/Latest.dart';
import 'package:raj_s_application9/app/models/PopulerMovies.dart';
import 'package:raj_s_application9/app/models/topratedmovies.dart';
import 'package:raj_s_application9/app/models/upcoming.dart';

import 'dashboard_state.dart';

class DashboardLogic extends GetxController {
  final DashboardState state = DashboardState();
  var topRatedMovies = TopRatedMovies().obs;
  var populerMovies = PopulerMovies().obs;
  var movieprovider = MovieProvider();
  var latestMovies = Latest().obs;
  var upcoming = UpComing().obs;


  @override
  void onInit() {
    super.onInit();
    populerMovies.value=PopulerMovies();
    topRatedMovies.value = TopRatedMovies();
    getTopratedMovies();
    getPopulerMovies();
    getUpcomingMovies();
  }

  Future<void> getTopratedMovies() async {
    movieprovider.getTopRatedMovies().then((value) {
      if (value.results!.isNotEmpty) {
        topRatedMovies.value = value;
      }
      update();
    });
  }

  Future<void> getPopulerMovies() async {
    try{
      movieprovider.getPopulerMovies().then((value) {
        populerMovies.value = value;
        update();
      });
    }
    catch(e){
      print("Exception caught at getting populer movies"+e.toString());
    }
  }
  Future<void> getLatest() async {
    try{
      movieprovider.getLatest().then((value) {
        latestMovies.value = value;
        update();
      });
    }
    catch(e){
      print("Exception caught at getting populer movies"+e.toString());
    }
  }

  void getUpcomingMovies() {
    movieprovider.getUpcomingResults().then((value) {
      upcoming.value=value;
      update();
    });
  }
}
