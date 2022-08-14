import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/upcoming_movie.dart';
import 'package:fluttery_movies/updates/upcoming_movie_update.dart';

enum UpcomingState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class UpcomingMovieProvider extends ChangeNotifier {
  List<UpcomingMovie> upcomingMovieList = [];
  UpcomingState state = UpcomingState.isInit;
  List<String> images = [];
  uploads() async {
    state = UpcomingState.isBusy;
    notifyListeners();
    var request = await UpcomingMovieUpdate().getUpcomingMovies();

    for (var element in request['results']) {
      upcomingMovieList.add(
        UpcomingMovie.fromJson(element),
      );
    }

    for (int i = 0; i < upcomingMovieList.length; i++) {
      String imageURLS = "${upcomingMovieList[i].posterPath}";
      images.add(imageURLS);
    }
    state = UpcomingState.isSuccess;
    notifyListeners();
  }
}
