import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/now_playing_movie_model.dart';
import 'package:fluttery_movies/updates/now_playing_movie_update.dart';

enum NowPlayingState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class NowPlayingProvider extends ChangeNotifier {
  List<NowPlayingMovieModel> nowPlayingList = [];
  List<NowPlayingMovieModel> nowPlayingListCopy = [];
  NowPlayingState state = NowPlayingState.isInit;

  uploads() async {
    nowPlayingList.clear();
    nowPlayingListCopy.clear();
    state = NowPlayingState.isBusy;
    notifyListeners();
    var request = await NowPlayingMovieUpdate().getNowPlayingMovies();

    for (var element in request['results']) {
      nowPlayingList.add(NowPlayingMovieModel.fromJson(element));
    }

    for (NowPlayingMovieModel element in nowPlayingList) {
      nowPlayingListCopy.add(element.copyWith());
    }

    state = NowPlayingState.isSuccess;

    notifyListeners();
  }

  searchFuncNowPlaying(String searchText) {    
    if (searchText.isNotEmpty) {
      List<NowPlayingMovieModel> tempSearchList = [];

      for (int i = 0; i < nowPlayingListCopy.length; i++) {
        bool result = nowPlayingListCopy[i]
            .originalTitle!
            .toLowerCase()
            .contains(searchText.toLowerCase());
        if (result) {
          tempSearchList.add(nowPlayingListCopy[i]);
        }
      }
      nowPlayingList = tempSearchList;
    } else {
      nowPlayingList = nowPlayingListCopy;
    }
    notifyListeners();
  }

  sortByNameNowPlaying() {
    nowPlayingList.sort((a, b) {
      return a.originalTitle!.compareTo(b.originalTitle!);
    });
    notifyListeners();
  }

  sortByPopularityNowPlaying() {
    nowPlayingList.sort(
      (a, b) {
        return a.popularity!.compareTo(b.popularity!);
      },
    );
    notifyListeners();
  }
}
