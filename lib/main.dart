/* Project 03
 * Created by Niko Castellana
 * CS 394 - Ugo Buy
 * 11/7/2021
 *
 * This project creates an app that displays my favorites
 * movies in a listview. Each ListView cell has the title
 * of each movie with an image and details about the movie.
 * Clicking on the information contained in the ListTile for
 * a movie will bring the user to the second screen. Additionally,
 * clicking on the ListTile using a long press will bring up a
 * a FocusedMenu with 3 dropdown items. The first one brings the
 * user to the third screen. The second one brings the user to
 * the wiki page for the movie. The last one brings the user to
 * the IMDb website.
 */
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'secondscreen.dart';
import 'thirdscreen.dart';
import 'moviehelper.dart';
import 'package:provider/provider.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MovieHelper(),
      child: MaterialApp(
          initialRoute: '/' ,
          onGenerateRoute: RouteGenerator.generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.yellow,
          ),
        ),
    );
  }
}


class FirstScreen extends StatefulWidget{
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreen createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {

  static late MovieHelper helper;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // Initialize provider instance
    helper = Provider.of<MovieHelper>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Favorite Movies",style: TextStyle(fontSize: 22.0,
              fontFamily: 'MoviePoster')
          )
        ),
        body: ListView.separated(
          itemCount: helper.movies.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(
              thickness: 3.0,
              color: Colors.black,
            ),

          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.black87,
                child: Row(
                  children:<Widget>[
                    Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Image.asset(helper.movieImages[index],fit:BoxFit.contain),
                    ),
                    Flexible(
                      flex: 9,
                      // Reference for FocusedMenuHolder:
                      // https://www.youtube.com/watch?v=Vttl7WGtkgg&t=169s
                      child: FocusedMenuHolder(
                        menuItems: [
                          FocusedMenuItem(
                            title: Text("More Info"),
                            // Pass in title of movie and additional info to 3rd screen
                            onPressed: (){
                              Navigator.of(context).pushNamed('/third',
                                  arguments: ScreenArgumentsTwo(helper.movies[index],
                                  helper.info[index])
                              );
                            },
                          ),
                          FocusedMenuItem(
                            title: Text("Go to Wiki Page"),
                            onPressed: () async{
                                await launch(Uri.encodeFull(helper.wiki[index]));
                              },
                          ),
                          FocusedMenuItem(
                            title: Text("Go to IMDb Page"),
                            onPressed: () async{
                              await launch(Uri.encodeFull(helper.url[index]));
                            },
                          ),
                        ],
                        onPressed: (){},
                        child: ListTile(
                            onTap: () {
                              // Pass in title of movie, the image, and IMDb url to 2nd screen
                              Navigator.of(context).pushNamed('/second',
                                  arguments: ScreenArguments(helper.movies[index],
                                      helper.movieImages[index],
                                      helper.url[index])
                              );
                            },
                            title: Text(helper.movies[index],textAlign:TextAlign.left,
                                style: const TextStyle(fontSize: 18.0, fontFamily: 'MoviePoster',
                                    color:Colors.yellow)),
                            subtitle: Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: Text(helper.movieDescription[index],textAlign:TextAlign.left,
                                  style: const TextStyle(color:Colors.yellow),)
                            ),
                          ),
                      ),
                   
                    ),
                  ],
                ),
            );
          },
        ),
      );
  }
}

// Arguments passed to second screen
class ScreenArguments {
  final String movieTitle;
  final String image;
  final String url;

  ScreenArguments(this.movieTitle, this.image, this.url);
}

// Arguments passed to third screen
class ScreenArgumentsTwo{
  final String movieTitle;
  final String movieInfo;

  ScreenArgumentsTwo(this.movieTitle, this.movieInfo);
}

// Reference for the route generator:
// https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/
//
// Dynamic route generator checks for routes with different named routes
// and text being passed to other classes
class RouteGenerator{
  static Route <dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case '/second':
        if(args is ScreenArguments){
          return MaterialPageRoute(builder: (_) =>
              SecondScreen(movie: args.movieTitle, image: args.image,
                  url: args.url ));
        }
        return _errorRoute();
      case '/third':
        if(args is ScreenArgumentsTwo){
          return MaterialPageRoute(builder: (_) =>
              ThirdScreen(movie: args.movieTitle, info: args.movieInfo));
        }
        return _errorRoute();
      default: return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Error",style: TextStyle(fontSize: 22.0,
              fontFamily: 'MoviePoster')
          ),
        ),
      );
    });
  }
}
