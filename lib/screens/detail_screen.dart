import 'package:flutter/material.dart';
import 'package:movieapp/models/movie_detail_model.dart';
import 'package:palette_generator/palette_generator.dart';

import '../services/api_services.dart';

class DetailSceen extends StatefulWidget {
  final String title, poster;
  final int id;

  const DetailSceen({
    super.key,
    required this.title,
    required this.poster,
    required this.id,
  });

  @override
  State<DetailSceen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailSceen> {
  late Future<MovieDetailModel> movie;
  late PaletteGenerator _generator;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        isAntiAlias: true,
        image: NetworkImage(
          widget.poster,
        ),
        fit: BoxFit.fitHeight,
        alignment: Alignment.topCenter,
      )),
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            title: const Text("Back To List")),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            FutureBuilder(
              future: movie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                            height: 150), // sized box above the title
                        Text(
                          snapshot.data!.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 40),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${snapshot.data!.voteAverage.toStringAsFixed(1)}/10",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ), // Text for the score
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Storyline",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ), // text for the storyline title
                        const SizedBox(height: 5),
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
