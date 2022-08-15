import 'package:flutter/material.dart';
import 'package:fluttery_movies/sorts/model_item.dart';

class SortsItems {
  static const sortByName = SortItem(text: "Sort by name");
  static const sortByPopularity = SortItem(text: "Sort by popularity");  

  static List<SortItem> itemSorts = [
    sortByName,
    sortByPopularity,
  ];
  


}
