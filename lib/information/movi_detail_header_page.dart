import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttery_movies/models/movie_detail.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movieDetail, {Key? key}) : super(key: key);

  MovieDetailModel movieDetail;
  _buildCategoryChips(TextTheme textTheme) {
    return movieDetail.genres?.map(
      (e) {
        return Chip(
          label: Text("$e"),
          labelStyle: textTheme.caption,
          backgroundColor: Colors.black12,
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {   
  }
}
