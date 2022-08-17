 import 'package:flutter/material.dart';
import 'package:fluttery_movies/information/movie_details_page.dart';
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
        switch (provider.state) {
          case UpcomingState.isBusy:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case UpcomingState.isSuccess:
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: provider.upcomingMovieList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
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
                  child: Stack(
                    children: [
                      SizedBox(
                          height: 235,
                          width: double.infinity,
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/${provider.upcomingMovieList[index].posterPath}",
                            fit: BoxFit.cover,
                          )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: double.infinity,
                          decoration:
                              const BoxDecoration(color: Colors.black45),
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
                    ],
                  ),
                );
              },
            );

          default:
        }
        return Container(
          color: Colors.white,
          child: const Center(
            child: Text("Network Error"),
          ),
        );
      },
    );
  }
}
