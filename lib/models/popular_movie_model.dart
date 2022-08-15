class PopularMovie {
  int? id;
  String? title;
  String? posterPath;
  String? backdropPath;
  String? originalTitle;
  double? voteAverage;
  String? overview;
  String? releaseDate;
  double? popularity;

  PopularMovie(
      {this.id,
      this.title,
      this.posterPath,
      this.backdropPath,
      this.originalTitle,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.popularity,
      });

  PopularMovie copyWith({
    int? id,
    String? title,
    String? posterPath,
    String? backdropPath,
    String? originalTitle,
    double? voteAverage,
    String? overview,
    String? releaseDate,
    double? popularity,
  }) {
    return PopularMovie(
      id: id ?? this.id,
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
      backdropPath: backdropPath ?? this.backdropPath,
      originalTitle: originalTitle ?? this.originalTitle,
      voteAverage: voteAverage ?? this.voteAverage,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      popularity: popularity ?? this.popularity,
    );
  }

  PopularMovie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    originalTitle = json['original_title'];
    voteAverage = (json['vote_average'] as num).toDouble();
    overview = json['overview'];
    releaseDate = json['release_date'];
    popularity = (json['popularity'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['poster_path'] = this.posterPath;
    data['backdrop_path'] = this.backdropPath;
    data['original_title'] = this.originalTitle;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['popularity'] = this.popularity;
    return data;
  }
}
