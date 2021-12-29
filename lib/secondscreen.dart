import 'package:flutter/material.dart';
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';

// Second app screen displays the title of the movie
// and an image of that movie. Clicking on the image
// of the movie will bring the user to the IMDb website.
//
class SecondScreen extends StatefulWidget{
  const SecondScreen({Key? key, required this.movie,
  required this.image, required this.url}) : super(key: key);

  final String movie;
  final String image;
  final String url;

  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.movie, style: const TextStyle(fontSize: 22.0,
            fontFamily: 'MoviePoster')),
      ),
      body: Center(
        child: TextButton(
          child: Container(
              child: Image.asset(widget.image),
          ),
          onPressed: () async{await launch(Uri.encodeFull(widget.url));},
        )
      ),
    );
  }
}