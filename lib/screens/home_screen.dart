import 'package:flutter/material.dart';
import 'package:movieapp/services/api_services.dart';
import 'package:movieapp/widgets/movie_widget.dart';

import '../models/movie_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowMovies = ApiService.getNowMovies();
  final Future<List<MovieModel>> comingMovies = ApiService.getComingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9fb),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Popular Movie",
                style: TextStyle(
                  color: Color(
                    0xFF202227,
                  ),
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 280,
                child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: makeListPopular(snapshot),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Now in Cinemas",
                style: TextStyle(
                  color: Color(
                    0xFF202227,
                  ),
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              Container(
                height: 265,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                child: FutureBuilder(
                  future: nowMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Expanded(
                            child: makeListNow(snapshot),
                          ),
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const Text(
                "Coming Soon",
                style: TextStyle(
                  color: Color(
                    0xFF202227,
                  ),
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ),
              Container(
                height: 265,
                constraints: const BoxConstraints(maxHeight: double.infinity),
                child: FutureBuilder(
                  future: comingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Expanded(
                            child: makeListNow(snapshot),
                          ),
                        ],
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeListNow(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var movie = snapshot.data![index];
          return NowMovie(
            id: movie.id,
            title: movie.title,
            poster: movie.poster,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
        itemCount: snapshot.data!.length);
  }

  ListView makeListPopular(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return PopularMovie(
          title: movie.title,
          poster: movie.poster,
          id: movie.id,
        );
      },
      itemCount: snapshot.data!.length,
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
