class MovieDetailModel {
  int? id;
  String? originalTitle;
  List<Genres>? genres;
  String? posterPath;
  String? overview;
  String? backdropPath;
  List<ProductionCompanies>? productionCompanies;
  double? voteAverage;

  MovieDetailModel(
      {this.id,
      this.originalTitle,
      this.genres,
      this.posterPath,
      this.overview,
      this.backdropPath,
      this.productionCompanies,
      this.voteAverage});

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalTitle = json['original_title'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    posterPath = json['poster_path'];
    overview = json['overview'];
    backdropPath = json['backdrop_path'];
    if (json['production_companies'] != null) {
      productionCompanies = <ProductionCompanies>[];
      json['production_companies'].forEach((v) {
        productionCompanies!.add(new ProductionCompanies.fromJson(v));
      });
    }
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['original_title'] = this.originalTitle;
    if (this.genres != null) {
      data['genres'] = this.genres!.map((v) => v.toJson()).toList();
    }
    data['poster_path'] = this.posterPath;
    data['overview'] = this.overview;
    data['backdrop_path'] = this.backdropPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies!.map((v) => v.toJson()).toList();
    }
    data['vote_average'] = this.voteAverage;
    return data;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
