import 'package:flutter/material.dart';
import 'package:fluttery_movies/information/MovieDetailsPage.dart';
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
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: provider.nowPlayingList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 0.8,
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
                height: 120,
                child: Stack(
                  children: [
                    SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: Image.network(
                          "https://image.tmdb.org/t/p/w500/${provider.nowPlayingList[index].posterPath}",
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
      },
    );
  }
}
