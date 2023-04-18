import 'package:flutter/material.dart';
import 'package:movieapp/screens/detail_screen.dart';

class PopularMovie extends StatelessWidget {
  final String title, poster;
  final int id;

  const PopularMovie({
    super.key,
    required this.title,
    required this.poster,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailSceen(
                title: title,
                poster: poster,
                id: id,
              ),
            ));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 300,
              height: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                poster,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NowMovie extends StatelessWidget {
  final String title, poster;
  final int id;
  const NowMovie(
      {super.key, required this.id, required this.title, required this.poster});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailSceen(
                title: title,
                poster: poster,
                id: id,
              ),
            ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 175,
            width: 175,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              poster,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: 130,
            child: Text(
              overflow: TextOverflow.fade,
              title,
              maxLines: 3,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }
}
