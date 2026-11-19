import 'package:flutter/material.dart';

List<String> images = [
  "lib/EX-3/assets/bird.jpg",
  "lib/EX-3/assets/bird2.jpg",
  "lib/EX-3/assets/insect.jpg",
  "lib/EX-3/assets/girl.jpg",
  "lib/EX-3/assets/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageState()
    ));
class ImageState extends StatefulWidget {
  const ImageState({super.key});

  @override
  State<ImageState> createState() => _ImageStateState();
}

class _ImageStateState extends State<ImageState> {

int currentIndex = 0;

void prevImg (){
  setState(() {
    if (currentIndex == 0) {
      currentIndex = images.length - 1;
    } else {
      currentIndex = currentIndex - 1;
    }
  });
}

void nextImg () {
  setState(() {
    if (currentIndex == images.length - 1) {
      currentIndex = 0;
    } else {
      currentIndex = currentIndex + 1;
    }
  });
}

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions:[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: prevImg ,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: nextImg,
              ),
            ),
          ],
        ),
        body: Image.asset(images[currentIndex]),
      );
  }
}

