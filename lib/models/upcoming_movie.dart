class UpcomingMovie {
  int? id;
  String? posterPath;
  String? backdropPath;
  String? originalTitle;
  double? voteAverage;
  String? overview;
  String? releaseDate;

  UpcomingMovie(
      {this.id,
      this.posterPath,
      this.backdropPath,
      this.originalTitle,
      this.voteAverage,
      this.overview,
      this.releaseDate});

  UpcomingMovie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
    voteAverage = (json['vote_average']as num).toDouble();
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    data['original_title'] = this.originalTitle;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    return data;
  }
}