import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fluttery_movies/utills/constants.dart';
import 'package:http/http.dart';

class NowPlayingMovieUpdate {
  // This method gets now playing movies data from API
  Future getNowPlayingMovies() async {
    String url = '$baseUrl/3/movie/now_playing?api_key=$apiKey&page=1';

    try {
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson =
            jsonDecode(response.body);

        return responseJson;
      } else {
        log("Error");
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    } catch (error) {
      log("$error");
    }
  }
}
