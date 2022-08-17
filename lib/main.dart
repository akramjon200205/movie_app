import 'package:flutter/material.dart';
import 'package:fluttery_movies/models/bottom_navigation_bar_provider.dart';
import 'package:fluttery_movies/providers/movie_provider.dart';
import 'package:fluttery_movies/providers/now_playing_provider.dart';
import 'package:fluttery_movies/providers/popular_movie_provider.dart';
import 'package:fluttery_movies/providers/upcoming_movie_provider.dart';
import 'package:fluttery_movies/screens/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NowPlayingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PopularMovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UpcomingMovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
        ),       
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,       
        home: MainPage(),
      ),
    );
  }
}
