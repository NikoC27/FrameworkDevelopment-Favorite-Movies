import 'package:flutter/material.dart';

class MovieHelper{
  List<String> movies = ["Lion King", "Forrest Gump", "Pulp Fiction",
    "The Matrix", "Halloween", "Step Brothers"];

  List<String> movieImages = ['assets_images/LionKing.jpg','assets_images/ForestGump.jpg',
    'assets_images/PulpFiction.jpg', 'assets_images/TheMatrix.jpeg', 'assets_images/Halloween.jpg',
    'assets_images/StepBrothers.jpg'];

  static const String _lionKing = 'Genre: Adventure\n'
      'Director: Roger Allers\n'
      'Year: 1999';
  static const String _forrestGump = 'Genre: Drama\n'
      'Director: Robert Zemeckis\n'
      'Year: 1994';
  static const String _pulpFiction = 'Genre: Crime\n'
      'Director: Quentin Tarantino\n'
      'Year: 1994';
  static const String _matrix = 'Genre: Action\n'
      'Director: Lana Wachowski\n'
      'Year: 1999';
  static const String _halloween = 'Genre: Horror\n'
      'Director: John Carpenter\n'
      'Year: 1978';
  static const String _stepBrothers = 'Genre: Comedy\n'
      'Director: Adam Mckay\n'
      'Year: 2008';

  static const List<String> _movieDescription = [_lionKing,_forrestGump,_pulpFiction,_matrix,
    _halloween,_stepBrothers ];

  List<String> get movieDescription => _movieDescription;

  static const String _lionKingUrl = 'https://www.imdb.com/title/tt0110357/?ref_=nv_sr_srsg_0';
  static const String _forrestGumpUrl = 'https://www.imdb.com/title/tt0109830/?ref_=nv_sr_srsg_0';
  static const String _pulpFictionUrl = 'https://www.imdb.com/title/tt0110912/?ref_=nv_sr_srsg_0';
  static const String _matrixUrl = 'https://www.imdb.com/title/tt0133093/?ref_=nv_sr_srsg_3';
  static const String _halloweenUrl = 'https://www.imdb.com/title/tt0077651/?ref_=nv_sr_srsg_4';
  static const String _stepBrothersUrl = 'https://www.imdb.com/title/tt0838283/?ref_=nv_sr_srsg_0';

  static const List<String> _url = [_lionKingUrl,_forrestGumpUrl,_pulpFictionUrl,_matrixUrl,
    _halloweenUrl,_stepBrothersUrl];

  List <String> get url => _url;

  static const String _lionKingInfo = 'Director: Roger Allers\n'
      'Movie Stars: Matthew Broderick, James Earl Jones\n'
      'Duration: 1h 28m\n'
      'IMDB Rating: 8.5/10\n'
      'Rotten Tomatoes: 93%\n';
  static const String _forrestGumpInfo = 'Director: Robert Zemeckis\n'
      'Movie Stars: Tom Hanks, Robin Wright\n'
      'Duration: 2h 22m\n'
      'IMDB Rating: 8.8/10\n'
      'Rotten Tomatoes: 71%\n';
  static const String _pulpFictionInfo = 'Director: Quentin Tarantino\n'
      'Movie Stars: Samuel L. Jackson, John Travolta\n'
      'Duration: 2h 34m\n'
      'IMDB Rating: 8.9/10\n'
      'Rotten Tomatoes: 92%\n';
  static const String _matrixInfo = 'Director: Lana Wachowski\n'
      'Movie Stars: Keanu Reeves, Laurence Fishburne\n'
      'Duration: 2h 16m\n'
      'IMDB Rating: 8.7/10\n'
      'Rotten Tomatoes: 88%\n';
  static const String _halloweenInfo = 'Director: John Carpenter\n'
      'Movie Stars: Donald Pleasence, Jamie Lee curtis\n'
      'Duration: 1h 31m\n'
      'IMDB Rating: 7.7/10\n'
      'Rotten Tomatoes: 96%\n';
  static const String _stepBrothersInfo = 'Director: Adam Mckay\n'
      'Movie Stars: Will Ferrell, John C.Reilly\n'
      'Duration: 1h 38m\n'
      'IMDB Rating: 6.9/10\n'
      'Rotten Tomatoes: 55%\n';

  static const List<String> _info = [_lionKingInfo,_forrestGumpInfo,_pulpFictionInfo,
    _matrixInfo,_halloweenInfo,_stepBrothersInfo];

  List<String> get info => _info;

  static const String _lionKingWiki = 'https://en.wikipedia.org/wiki/The_Lion_King';
  static const String _forrestGumpWiki = 'https://en.wikipedia.org/wiki/Forrest_Gump';
  static const String _pulpFictionWiki = 'https://en.wikipedia.org/wiki/Pulp_Fiction';
  static const String _matrixWiki = 'https://en.wikipedia.org/wiki/The_Matrix';
  static const String _halloweenWiki = 'https://en.wikipedia.org/wiki/Halloween_(1978_film)';
  static const String _stepBrothersWiki = 'https://en.wikipedia.org/wiki/Step_Brothers_(film)';

  static const List<String> _wiki = [_lionKingWiki,_forrestGumpWiki,_pulpFictionWiki,
    _matrixWiki,_halloweenWiki,_stepBrothersWiki];

  List<String> get wiki => _wiki;
}