import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/now_playing_movie.dart';
import 'package:fluttery_movies/updates/now_playing_movie_update.dart';

enum NowPlayingState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class NowPlayingProvider extends ChangeNotifier {
  List<NowPlayingMovieModel> nowPlayingList = [];
  NowPlayingState state = NowPlayingState.isInit;
  NowPlayingMovieModel nowPlayingMovieModel = NowPlayingMovieModel();
  List<String> images = [];

  uploads() async {
    state = NowPlayingState.isBusy;
    notifyListeners();
    var request = await NowPlayingMovieUpdate().getNowPlayingMovies();

    for (var element in request['results']) {
      // nowPlayingMovieModel = ;
      nowPlayingList.add(NowPlayingMovieModel.fromJson(element));
    }

    for (int i = 0; i < nowPlayingList.length; i++) {
      String imageURLS =
          "${nowPlayingList[i].posterPath}";
      images.add(imageURLS);
    }

    state = NowPlayingState.isSuccess;
    // print(nowPlayingList.length);
    // print('$images\n');
    notifyListeners();
  }
}
