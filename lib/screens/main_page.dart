import 'package:flutter/material.dart';
import 'package:fluttery_movies/models/bottom_navigation_bar_provider.dart';
import 'package:fluttery_movies/providers/now_playing_provider.dart';
import 'package:fluttery_movies/providers/popular_movie_provider.dart';

import 'package:fluttery_movies/providers/upcoming_movie_provider.dart';
import 'package:fluttery_movies/screens/now_playing_page.dart';
import 'package:fluttery_movies/screens/popular_movie_page.dart';
import 'package:fluttery_movies/screens/upcoming_page.dart';
import 'package:fluttery_movies/sorts/model_item.dart';
import 'package:fluttery_movies/sorts/sort_items.dart';
import 'package:fluttery_movies/utills/constants.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BottomNavigationBarProvider>().currentIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
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
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(30),
              child: Container(
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 25,
                      ),
                      hintText: 'Search...',
                      hintStyle: kTextStyle(
                        size: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    onChanged: (text) {
                      switch (provider.currentIndex) {
                        case 0:
                          context
                              .read<NowPlayingProvider>()
                              .searchFuncNowPlaying(text);
                          break;
                        case 1:
                          context
                              .read<UpcomingMovieProvider>()
                              .searchFuncUpcoming(text);
                          break;
                        case 2:
                          context
                              .read<PopularMovieProvider>()
                              .searchFuncPopular(text);
                          break;
                        default:
                      }
                    },
                  ),
                ),
              ),
            ),
            actions: [
              PopupMenuButton<SortItem>(
                onSelected: (item) {
                  provider.currentIndex == 0
                      ? onSelectedNowPlaying(context, item)
                      : provider.currentIndex == 1
                          ? onSelectedUpcoming(context, item)
                          : onSelectedPopular(context, item);
                },
                itemBuilder: (_) => [
                  ...SortsItems.itemSorts.map(buildItem).toList(),
                ],
              )
            ],
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

  PopupMenuItem<SortItem> buildItem(SortItem item) => PopupMenuItem<SortItem>(
        value: item,
        child: Text(item.text),
      );

  onSelectedNowPlaying(
    BuildContext context,
    SortItem item,
  ) {
    switch (item) {
      case SortsItems.sortByName:
        context.read<NowPlayingProvider>().sortByNameNowPlaying();
        break;
      case SortsItems.sortByPopularity:
        context.read<NowPlayingProvider>().sortByPopularityNowPlaying();
        break;
      default:
    }
  }

  onSelectedPopular(
    BuildContext context,
    SortItem item,
  ) {
    switch (item) {
      case SortsItems.sortByName:
        context.read<PopularMovieProvider>().sortByNamePopular();
        break;
      case SortsItems.sortByPopularity:
        context.read<PopularMovieProvider>().sortByPopularityPopular();
        break;
      default:
    }
  }

  onSelectedUpcoming(
    BuildContext context,
    SortItem item,
  ) {
    switch (item) {
      case SortsItems.sortByName:
        context.read<UpcomingMovieProvider>().sortByNameUpcoming();
        break;
      case SortsItems.sortByPopularity:
        context.read<UpcomingMovieProvider>().sortByPopularityUpcoming();
        break;
      default:
    }
  }
}
