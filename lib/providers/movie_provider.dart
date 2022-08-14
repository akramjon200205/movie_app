import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/movie_detail.dart';
import 'package:fluttery_movies/updates/movie_model_update.dart';

enum MovieDetailState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class MovieProvider extends ChangeNotifier {
  List<MovieDetailModel> movieDetailModelList = [];
  MovieDetailState state = MovieDetailState.isInit;
  MovieDetailModel movieDetailModel = MovieDetailModel();
  List<String> images = [];

  uploads() async {
    state = MovieDetailState.isBusy;
    notifyListeners();
    var request = await MovieDetailUpdate().getMovieDetailMovies();

    for (var element in request['results']) {      
      movieDetailModelList.add(MovieDetailModel.fromJson(element));
    }

    for (int i = 0; i < movieDetailModelList.length; i++) {
      String imageURLS =
          "${movieDetailModelList[i].posterPath}";
      images.add(imageURLS);
    }

    state = MovieDetailState.isSuccess;
    print(movieDetailModelList.length);
    print('$images\n');
    notifyListeners();
  }
}
