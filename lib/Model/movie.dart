class Movie {
  int? id;
  String? title;
  int? year;
  double? rating;
  int? runtime;
  List<String>? genres;
  String? summary;
  String? descriptionFull;

  String? backgroundImage;
  String? backgroundImageOriginal;
  String? largeCoverImage;
  String? mediumCoverImage;
  

  Movie({
    this.id,
    this.title,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.largeCoverImage,
    this.mediumCoverImage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    rating = (json['rating'] as num?)?.toDouble();
    runtime = json['runtime'];
    genres = json['genres']?.cast<String>();
    summary = json['summary'];
    descriptionFull = json['description_full'];

    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    largeCoverImage = json['large_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
  }
}