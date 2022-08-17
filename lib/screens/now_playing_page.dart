import 'package:flutter/material.dart';
import 'package:fluttery_movies/information/movie_details_page.dart';
import 'package:fluttery_movies/providers/now_playing_provider.dart';
import 'package:fluttery_movies/utills/constants.dart';
import 'package:provider/provider.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NowPlayingProvider>(
      builder: (context, provider, child) {
        if (provider.state == NowPlayingState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.uploads();
          });
        }
        switch (provider.state) {
          case NowPlayingState.isBusy:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case NowPlayingState.isSuccess:
            return GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: provider.nowPlayingList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (provider.nowPlayingList[index].id! > 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => MovieDetailsPage(
                                    provider.nowPlayingList[index].id!,
                                  )));
                    }
                  },
                  child: SizedBox(
                    height: 150,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: 235,
                          width: double.infinity,
                          child: Hero(
                            tag: 'hero_poster_path',
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/${provider.nowPlayingList[index].posterPath}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: double.infinity,
                            decoration:
                                const BoxDecoration(color: Colors.black45),
                            child: Text(
                              "${provider.nowPlayingList[index].originalTitle}",
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
