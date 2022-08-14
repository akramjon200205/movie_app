// import 'package:fluttery_movies/models/movie_detail.dart';
// import 'package:fluttery_movies/updates/movie_model_update.dart';

// void main(List<String> args) {
//   MovieProvider().uploads();
// }

// class MovieProvider {
//   List<MovieDetailModel> movieDetailModelList = [];
 
//   MovieDetailModel movieDetailModel = MovieDetailModel();
//   List<String> images = [];

//   uploads() async { 
//     var request = await MovieDetailUpdate().getMovieDetailMovies();
//     for (var element in request['results']) {
//       movieDetailModelList.add(MovieDetailModel.fromJson(element));
//     }
//     for (int i = 0; i < movieDetailModelList.length; i++) {
//       String imageURLS = "${movieDetailModelList[i].posterPath}";
//       images.add(imageURLS);
//     }   
//   }
// }
