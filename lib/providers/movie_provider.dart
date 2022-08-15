import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/movie_detail_model.dart';
import 'package:fluttery_movies/updates/movie_model_update.dart';

enum MovieDetailState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class MovieProvider extends ChangeNotifier {
  MovieDetailState state = MovieDetailState.isInit;
  late MovieDetailModel movieDetailModel;

  uploads(int movieId) async {
    state = MovieDetailState.isBusy;
    notifyListeners();
    var request = await MovieDetailUpdate().getMovieDetailMovies(movieId);

    movieDetailModel = MovieDetailModel.fromJson(request);

    state = MovieDetailState.isSuccess;
    
    notifyListeners();
  }

  void updatePage() {
    notifyListeners();
  }

  onDispose() {
    state = MovieDetailState.isInit;
  }
}
