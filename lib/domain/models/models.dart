import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Movie {
  final int id;
  final String title;
  final String releaseDate;
  final String overview;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}





@JsonSerializable()
class MovieDetails {
  final int id;
  final String title;
  final String overview;
  final String homepage;
  final String? backdropPath;
  final String? posterPath;
  final String releaseDate;
  final List<Genre> genres;
  final String status;
  final String tagline;
  final bool video;
  final double voteAverage;
  final int voteCount;

  MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    required this.homepage,
    this.backdropPath,
    this.posterPath,
    required this.releaseDate,
    required this.genres,
    required this.status,
    required this.tagline,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

class SeatModel{
  String time;
  String theatre;
  double fromprice;
  double bonusprice;
  SeatModel({required this.time,required this.theatre,required this.fromprice,required this.bonusprice});
}
