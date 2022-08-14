import 'package:flutter/material.dart';
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
            String images =
                "https://image.tmdb.org/t/p/w500/${provider.images[index]}";
            return GestureDetector(
              onTap: () {},
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
                        "${provider.nowPlayingList[index].originalTitle}",
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
