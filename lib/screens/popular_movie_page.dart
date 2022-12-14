import 'package:flutter/material.dart';
import 'package:fluttery_movies/information/movie_details_page.dart';
import 'package:fluttery_movies/providers/popular_movie_provider.dart';
import 'package:fluttery_movies/utills/constants.dart';
import 'package:provider/provider.dart';

class PopularPage extends StatefulWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  State<PopularPage> createState() => _PopularPageState();
}

class _PopularPageState extends State<PopularPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PopularMovieProvider>(
      builder: (context, provider, child) {
        if (provider.state == PopularMovieState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.uploads();
          });
        }
        switch (provider.state) {
          case PopularMovieState.isBusy:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case PopularMovieState.isSuccess:
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: provider.popularMovieList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (provider.popularMovieList[index].id! > 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MovieDetailsPage(
                                    provider.popularMovieList[index].id!,
                                  )));
                    }
                  },
                  child: Stack(children: [
                    SizedBox(
                        height: 235,
                        width: double.infinity,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500/${provider.popularMovieList[index].posterPath}",
                          fit: BoxFit.cover,
                        )),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: double.infinity,
                        decoration: const BoxDecoration(color: Colors.black45),
                        child: Text(
                          "${provider.popularMovieList[index].originalTitle}",
                          style: kTextStyle(
                            size: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ]),
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
