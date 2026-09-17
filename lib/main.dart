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
  Artwork(
    title: 'The Great Wave off Kanagawa',
    artist: 'Katsushika Hokusai',
    year: '1831',
    imagePath: 'assets/images/artwork/great_wave.jpg',
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
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Container(
                height: 340,
                alignment: Alignment.center,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 340,
                    maxWidth: 300,
                  ),
                  padding: EdgeInsets.all(16), 
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    border: Border.all(color: Colors.amber, width: 2),
                  ),
                  child: Image.asset(artworks[currentArtIndex].imagePath,
                  ),
                ),
              ),
              Container(
                width : 300,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  children: [
                    Text(
                      artworks[currentArtIndex].title,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      '${artworks[currentArtIndex].artist} (${artworks[currentArtIndex].year})',
                    ),
                  ],
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                    ),
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
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                    ),
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
