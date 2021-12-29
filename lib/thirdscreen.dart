import 'package:flutter/material.dart';
import 'main.dart';

// Third app screen displays the information about each movie.
// The screen displays the director, movie stars, duration and
// two ratings.
//
class ThirdScreen extends StatefulWidget{
  const ThirdScreen({Key? key, required this.movie, required this.info}) : super(key: key);
  final String movie;
  final String info;
  @override
  _ThirdScreen createState() => _ThirdScreen();
}

class _ThirdScreen extends State<ThirdScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.movie, style: const TextStyle(fontSize: 22.0,
            fontFamily: 'MoviePoster')),
      ),
      body: Center(
        child: Text(widget.info, style: const TextStyle(fontSize: 22.0,color:Colors.yellow)),
      ),
    );
  }
}