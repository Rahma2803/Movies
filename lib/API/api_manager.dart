import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/API/api_constants.dart';
import 'package:movies/API/end_points.dart';
import 'package:movies/Model/movies_response.dart';

class ApiManager {
  static Future<MoviesResponse> getAvailableNowMovies() async {
    Uri url = Uri.http(
      ApiConstants.baseUrl,
      EndPoints.listMovies,
      {
        "sort_by": "year",
        "order_by": "desc",
        "limit": "5",
      },
    );
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return MoviesResponse.fromJson(json);
  }
  static Future<MoviesResponse> getMoviesByGenre(String genre) async {
    Uri url = Uri.http(
      ApiConstants.baseUrl,
      EndPoints.listMovies,
      {
        "genre": genre,
        "limit": "20",
      },
    );

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return MoviesResponse.fromJson(json);
  }
}