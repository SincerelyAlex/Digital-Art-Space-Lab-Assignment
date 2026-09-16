import 'package:flutter/material.dart';

class Artwork {
  final String title;
  final String artist;
  final String year;
  final String imagePath;
  
  Artwork({
    required this.title,
    required this.artist,
    required this.year,
    required this.imagePath,
  });
}

List<Artwork> artworks = [
  Artwork(
    title: 'Starry Night',
    artist: 'Vincent van Gogh',
    year: '1889',
    imagePath: 'assets/images/artwork/starry_night.jpg',
  ),
  Artwork(
    title: 'Mona Lisa',
    artist: 'Leonardo da Vinci',
    year: '1503',
    imagePath: 'assets/images/artwork/mona_lisa.jpg',
  ),
  Artwork(
    title: 'The Scream',
    artist: 'Edvard Munch',
    year: '1893',
    imagePath: 'assets/images/artwork/the_scream.jpg',
  ),
];
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
