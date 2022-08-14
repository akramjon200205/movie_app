import 'package:flutter/material.dart';
import 'package:fluttery_movies/information/MovieDetailsPage.dart';
import 'package:fluttery_movies/models/upcoming_movie.dart';
import 'package:fluttery_movies/providers/now_playing_provider.dart';
import 'package:fluttery_movies/providers/upcoming_movie_provider.dart';
import 'package:fluttery_movies/utills/constants.dart';
import 'package:provider/provider.dart';

class UpcomingMoviePage extends StatefulWidget {
  const UpcomingMoviePage({Key? key}) : super(key: key);

  @override
  State<UpcomingMoviePage> createState() => _UpcomingMoviePageState();
}

class _UpcomingMoviePageState extends State<UpcomingMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpcomingMovieProvider>(
      builder: (context, provider, child) {
        if (provider.state == UpcomingState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.uploads();
          });
        }
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: provider.upcomingMovieList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            String images =
                "https://image.tmdb.org/t/p/w500/${provider.images[index]}";
            return GestureDetector(
              onTap: () {
                if (provider.upcomingMovieList[index].id! > 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MovieDetailsPage(
                                provider.upcomingMovieList[index].id!,
                              )));
                }
              },
              child: SizedBox(
                height: 120,
                child: Stack(children: [
                  SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: Image.network(
                        images,
                        fit: BoxFit.cover,
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: double.infinity,
                      decoration: const BoxDecoration(color: Colors.black45),
                      child: Text(
                        "${provider.upcomingMovieList[index].originalTitle}",
                        style: kTextStyle(
                          size: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            );
          },
        );
      },
    );
  }
}
