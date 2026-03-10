import 'package:movies/Model/movie.dart';
import 'movie.dart';

class MoviesResponse {
  String? status;
  String? statusMessage;
  MovieData? data;

  MoviesResponse({
    this.status,
    this.statusMessage,
    this.data,
  });

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? MovieData.fromJson(json['data']) : null;
  }
}

class MovieData {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movie>? movies;

  MovieData({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,
  });

  MovieData.fromJson(Map<String, dynamic> json) {
    movieCount = json['movie_count'];
    limit = json['limit'];
    pageNumber = json['page_number'];

    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies!.add(Movie.fromJson(v));
      });
    }
  }
}