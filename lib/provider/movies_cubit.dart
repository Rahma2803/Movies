import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/API/api_manager.dart';
import 'package:movies/Model/movie.dart';

class MoviesCubit extends Cubit<List<Movie>> {
  MoviesCubit() : super([]);
  int currentIndex = 0;
  Future<void> loadMovies() async {
    var response = await ApiManager.getAvailableNowMovies();
    List<Movie> movies = response.data?.movies ?? [];
    emit(movies);
  }
  void changeIndex(int index) {
    currentIndex = index;
    emit(state);
  }
}