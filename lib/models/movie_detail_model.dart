class MovieDetailModel {
  final String title, about;
  final double voteAverage;
  final List<dynamic> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["original_title"],
        about = json["overview"],
        genres = json["genres"],
        voteAverage = json["vote_average"];
}
