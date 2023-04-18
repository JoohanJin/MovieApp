class MovieModel {
  static const String prePosterLink = "https://image.tmdb.org/t/p/w500";
  final String title, poster;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json["original_title"],
        poster = "$prePosterLink${json["poster_path"]}",
        id = json["id"];
}
