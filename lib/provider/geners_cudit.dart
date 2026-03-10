import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/API/api_manager.dart';
import 'package:movies/Model/movie.dart';

class GenresCubit extends Cubit<Map<String, List<Movie>>> {
  GenresCubit() : super({});

  final List<String> genres = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Drama",
    "Fantasy",
    "Horror",
    "Mystery",
    "Romance",
    "Sci-Fi",
    "Thriller",
  ];

  Future<void> loadGenresMovies() async {
    Map<String, List<Movie>> result = {};

    for (var genre in genres) {
      var response = await ApiManager.getMoviesByGenre(genre);
      result[genre] = response.data?.movies ?? [];
    }

    emit(result);
  }
}