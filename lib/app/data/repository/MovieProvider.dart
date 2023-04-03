import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:raj_s_application9/app/models/PopulerMovies.dart';
import 'package:raj_s_application9/app/models/SearchRequest.dart';
import 'package:raj_s_application9/app/models/upcoming.dart';

import '../../models/Latest.dart';
import '../../models/topratedmovies.dart';

class Consts {
  static String api_key = "909594533c98883408adef5d56143539";

  static String base_url = "https://api.themoviedb.org/";

  static String getTopRatedMovies = "3/movie/top_rated?api_key=";

  static String getImageUrl = "http://image.tmdb.org/t/p/w500/";

  static String populerMovies = "/3/tv/popular?api_key=";

  static String SearchQuery = "/3/search/tv?api_key=";

  static String getLatest = "3/tv/latest?api_key=";
}

class MovieProvider extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
  }

  Future<TopRatedMovies> getTopRatedMovies() async {
    var request = await http.get(
        Uri.parse(Consts.base_url + Consts.getTopRatedMovies + Consts.api_key));
    http.Response response = request;
    if (response.statusCode == 200) {
      return TopRatedMovies.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print(response.reasonPhrase);
    }
    return TopRatedMovies();
  }

  Future<PopulerMovies> getPopulerMovies() async {
    try {
      var response = await http.get(
          Uri.parse(Consts.base_url + Consts.populerMovies + Consts.api_key));
      if (response.statusCode == 200) {
        print("Populer movies" + response.body);

        var json = PopulerMovies.fromJson(
            jsonDecode(response.body) as Map<String, dynamic>);
        return json;
      } else {
        print(response.reasonPhrase);
        return PopulerMovies();
      }
    } catch (e) {
      print("Exception caught with exception" + e.toString());
      return PopulerMovies();
    }
  }

  Future<Latest> getLatest() async {
    var response = await http
        .get(Uri.parse(Consts.base_url + Consts.getLatest + Consts.api_key));
    if (response.statusCode == 200) {
      var json =
          Latest.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return json;
    } else {
      print(response.reasonPhrase);
      return Latest();
    }
  }

  Future<SearchRequest> getSearchResults(String query) async {
    print("Listning to request");
    var response = await http.get(Uri.parse(Consts.base_url +
        Consts.SearchQuery +
        Consts.api_key +
        "&query=" +
        query));
    if (response.statusCode == 200) {
      var json = SearchRequest.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      print(response.body);
      return json;
    } else {
      print(response.reasonPhrase);
      return SearchRequest();
    }
  }

  Future<UpComing> getUpcomingResults() async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=' +
            Consts.api_key));
    if (response.statusCode == 200) {
      var json =
          UpComing.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      return json;
    } else {
      print(response.reasonPhrase);
      return UpComing();
    }
  }
}
