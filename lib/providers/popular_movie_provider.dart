import 'package:flutter/cupertino.dart';
import 'package:fluttery_movies/models/popular_movie_model.dart';
import 'package:fluttery_movies/updates/popular_movie_update.dart';

enum PopularMovieState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

class PopularMovieProvider extends ChangeNotifier {
  List<PopularMovie> popularMovieList = [];
  List<PopularMovie> popularMovieListCopy = [];
  PopularMovieState state = PopularMovieState.isInit;
  List<String> images = [];

  uploads() async {
    popularMovieList.clear();
    popularMovieListCopy.clear();
    state = PopularMovieState.isBusy;
    notifyListeners();
    var request = await PopularMovieUpdate().getPopularMovies();

    for (var element in request['results']) {
      popularMovieList.add(
        PopularMovie.fromJson(element),
      );
    }
    for (PopularMovie element in popularMovieList) {
      popularMovieListCopy.add(element.copyWith());
    }
        
    state = PopularMovieState.isSuccess;    
    notifyListeners();
  }

  
  searchFuncPopular(String searchText) {
    print(searchText);
    if (searchText.isNotEmpty) {
      List<PopularMovie> tempSearchList = [];

      for (int i = 0; i < popularMovieListCopy.length; i++) {
        bool result = popularMovieListCopy[i]
            .originalTitle!
            .toLowerCase()
            .contains(searchText.toLowerCase());
        if (result) {
          tempSearchList.add(popularMovieListCopy[i]);
        }
      }
      popularMovieList = tempSearchList;
    } else {
      popularMovieList = popularMovieListCopy;
    }
    notifyListeners();
  }

  sortByNamePopular() {
    popularMovieList.sort((a, b) {
      return a.originalTitle!.compareTo(b.originalTitle!);
    });
    notifyListeners();
  }

  sortByPopularityPopular() {
    popularMovieList.sort(
      (a, b) {
        return a.popularity!.compareTo(b.popularity!);
      },
    );
    notifyListeners();
  }
}
