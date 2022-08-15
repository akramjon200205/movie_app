import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/upcoming_movie_model.dart';
import 'package:fluttery_movies/updates/upcoming_movie_update.dart';

enum UpcomingState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class UpcomingMovieProvider extends ChangeNotifier {
  List<UpcomingMovie> upcomingMovieList = [];
  List<UpcomingMovie> upcomingMovieListCopy = [];

  UpcomingState state = UpcomingState.isInit;
  List<String> images = [];

  uploads() async {
    upcomingMovieList.clear();
    upcomingMovieListCopy.clear();
    state = UpcomingState.isBusy;
    notifyListeners();
    var request = await UpcomingMovieUpdate().getUpcomingMovies();

    for (var element in request['results']) {
      upcomingMovieList.add(
        UpcomingMovie.fromJson(element),
      );
    }

    for (UpcomingMovie element in upcomingMovieList) {
      upcomingMovieListCopy.add(element.copyWith());
    }

    print(upcomingMovieList[0].popularity);
    state = UpcomingState.isSuccess;
    notifyListeners();
  }

  searchFuncUpcoming(String searchText) {
    print(searchText);
    if (searchText.isNotEmpty) {
      List<UpcomingMovie> tempSearchList = [];

      for (int i = 0; i < upcomingMovieListCopy.length; i++) {
        bool result = upcomingMovieListCopy[i]
            .originalTitle!
            .toLowerCase()
            .contains(searchText.toLowerCase());
        if (result) {
          tempSearchList.add(upcomingMovieListCopy[i]);
        }
      }
      upcomingMovieList = tempSearchList;
    } else {
      upcomingMovieList = upcomingMovieListCopy;
    }
    notifyListeners();
  }

  sortByNameUpcoming() {
    upcomingMovieList.sort((a, b) {
      return a.originalTitle!.compareTo(b.originalTitle!);
    });
    notifyListeners();
  }

  sortByPopularityUpcoming() {
    upcomingMovieList.sort(
      (a, b) {
        return a.popularity!.compareTo(b.popularity!);
      },
    );
    notifyListeners();
  }
}
