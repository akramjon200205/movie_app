import 'package:flutter/material.dart';
import 'package:fluttery_movies/models/bottom_navigation_bar_provider.dart';
import 'package:fluttery_movies/screens/now_playing_page.dart';
import 'package:fluttery_movies/screens/popular_movie_page.dart';
import 'package:fluttery_movies/screens/upcoming_page.dart';
import 'package:fluttery_movies/utills/constants.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BottomNavigationBarProvider>().currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Fluttery Movies",
              style: kTextStyle(
                size: 25,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          body: provider.currentIndex == 0
              ? const NowPlaying()
              : provider.currentIndex == 2
                  ? const PopularPage()
                  : const UpcomingMoviePage(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex!,
            onTap: (index) {
              provider.currentIndex = index;
              provider.updatePage();
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.event_seat,
                  size: 20,
                  color: provider.currentIndex == 0
                      ? Colors.blue[400]
                      : Colors.black87,
                ),
                label: 'Now Playing',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.event,
                  size: 20,
                  color: provider.currentIndex == 1
                      ? Colors.blue[400]
                      : Colors.black87,
                ),
                label: 'Upcoming',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 20,
                  color: provider.currentIndex == 2
                      ? Colors.blue[400]
                      : Colors.black87,
                ),
                label: 'Popular',
              ),
            ],
          ),
        );
      },
    );
  }
}
