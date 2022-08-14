import 'package:flutter/material.dart';

TextStyle kTextStyle({
  Color? color,
  double size = 14,
  FontWeight fontWeight = FontWeight.w500,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}

enum ComState {
  isInit,
  isBusy,
  isSuccess,
  isError,
}

String apiKey = '5b83b64a01ce684cba8effc08f9c15ec';

String baseUrl = 'https://api.themoviedb.org';
