import 'package:flutter/material.dart';
import 'package:fluttery_movies/information/MovieDetailHeader.dart';
import 'package:fluttery_movies/information/ProductionCompaniesScroller.dart';
import 'package:fluttery_movies/information/StoryLine.dart';

import 'package:fluttery_movies/providers/movie_provider.dart';

import 'package:provider/provider.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieProvider providers;
  @override
  void dispose() {
    providers.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, provider, child) {
        providers = provider;
        if (provider.state == MovieDetailState.isInit) {
          Future.delayed(Duration.zero, () {
            provider.uploads(widget.id);
            provider.updatePage();
          });
        }
        switch (provider.state) {
          case MovieDetailState.isBusy:
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          case MovieDetailState.isSuccess:
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    MovieDetailHeader(provider.movieDetailModel),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: StoryLine(provider.movieDetailModel.overview!),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        bottom: 50.0,
                      ),
                      child: ProductionCompaniesScroller(
                          provider.movieDetailModel.productionCompanies!),
                    ),
                  ],
                ),
              ),
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
