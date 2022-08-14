import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/popular_movie.dart';
import 'package:fluttery_movies/updates/popular_movie_update.dart';

enum PopularMovieState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class PopularMovieProvider extends ChangeNotifier {
  List<PopularMovie> popularMovieList = [];
  PopularMovieState state = PopularMovieState.isInit;
  List<String> images = [];
  uploads() async {
    state = PopularMovieState.isBusy;
    notifyListeners();
    var request = await PopularMovieUpdate().getPopularMovies();

    for (var element in request['results']) {
      popularMovieList.add(
        PopularMovie.fromJson(element),
      );
    }

    for (int i = 0; i < popularMovieList.length; i++) {
      String imageURLS = "${popularMovieList[i].posterPath}";
      images.add(imageURLS);
    }
    state = PopularMovieState.isSuccess;
    print(popularMovieList.length);
    print(images);
    notifyListeners();
  }
}
