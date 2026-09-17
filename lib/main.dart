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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int currentArtIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Digital Art Space')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(artworks[currentArtIndex].imagePath,
                width: 280,
                height: 320,
              ),
              Text(
                artworks[currentArtIndex].title,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                '${artworks[currentArtIndex].artist}, ${artworks[currentArtIndex].year}',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentArtIndex--;
                        if (currentArtIndex < 0) {
                          currentArtIndex = artworks.length - 1;
                        }
                      });
                    },
                    child: Text('Previous'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentArtIndex++;
                        if (currentArtIndex >= artworks.length) {
                          currentArtIndex = 0;
                        }
                      });
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
