import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:privacy_of_animal/models/intro_page_model.dart';
import 'package:privacy_of_animal/models/tag_model.dart';
import 'package:privacy_of_animal/resources/colors.dart';
import 'package:privacy_of_animal/resources/strings.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

final double dashedCircleRadius = ScreenUtil.height/16;
final double dashedBackgroundCircleDiameter = dashedCircleRadius*2+30.0;

class ScreenUtil {
  static double width;
  static double height;
}

const TextStyle primaryTextStyle = 
TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20.0
);

class CurrentPlatform {
  static TargetPlatform platform;
}

const pages = [
  const IntroPageModel(
    backgroundColor: primaryPink,
    image: 'assets/images/animals/lion.jpg',
    aboveMessage: introMessage1Above,
    belowMessage: introMessage1Below,
  ),

  IntroPageModel(
    backgroundColor: primaryGreen,
    image: 'assets/images/animals/bison.jpg',
    aboveMessage: introMessage2Above,
    belowMessage: introMessage2Below,
  ),
  IntroPageModel(
    backgroundColor: primaryBlue,
    image: 'assets/images/animals/tiger.jpg',
    aboveMessage: introMessage3Above,
    belowMessage: introMessage3Below,
  )
];

Map<String,String> tagToMessage = {
  art: tagArtMessage,
  book: tagBookMessage,
  cartoon: tagCartoonMessage,
  celebrity: tagCelebrityMessage,
  drama: tagDramaMessage,
  fashion: tagFashionMessage,
  food: tagFoodMessage,
  game: tagGameMessage,
  leisure: tagLeisureMessage,
  makeup: tagMakeupMessage,
  movie: tagMovieMessage,
  photo: tagPhotoMessage,
  singleLife: tagSingleLifeMessage,
  sport: tagSportMessage,
  music: tagMusicMessage
};

WebviewScaffold webViewImage(String keyword) {
  return WebviewScaffold(
    url: 'https://www.google.co.kr/search?q=$keyword&hl=ko&source=lnms&tbm=isch',
    appBar: AppBar(
      title: Text(
        '구글 검색 결과',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: primaryBlue,
    )
  );
}

const agePickerData = '''
[
  {
    "10대":[10,11,12,13,14,15,16,17,18,19]
  },
  {
    "20대":[20,21,22,23,24,25,26,27,28,29]
  },
  {
    "30대":[30,31,32,33,34,35,36,37,38,39]
  },
  {
    "40대":[40,41,42,43,44,45,46,47,48,49]
  },
  {
    "50대":[50,51,52,53,54,55,56,57,58,59]
  }
]
''';

const tags = [
  const Tag(
    title: art,
    image: AssetImage('assets/images/tags/art.png')
  ),
  const Tag(
    title: book,
    image: AssetImage('assets/images/tags/book.png')
  ),
  const Tag(
    title: cartoon,
    image: AssetImage('assets/images/tags/cartoon.png')
  ),
  const Tag(
    title: celebrity,
    image: AssetImage('assets/images/tags/celebrity.png')
  ),
  const Tag(
    title: drama,
    image: AssetImage('assets/images/tags/drama.png')
  ),
  const Tag(
    title: fashion,
    image: AssetImage('assets/images/tags/fashion.png')
  ),
  const Tag(
    title: food,
    image: AssetImage('assets/images/tags/food.png')
  ),
  const Tag(
    title: game,
    image: AssetImage('assets/images/tags/game.png')
  ),
  const Tag(
    title: leisure,
    image: AssetImage('assets/images/tags/leisure.png')
  ),
  const Tag(
    title: makeup,
    image: AssetImage('assets/images/tags/makeup.png')
  ),
  const Tag(
    title: movie,
    image: AssetImage('assets/images/tags/movie.png')
  ),
  const Tag(
    title: photo,
    image: AssetImage('assets/images/tags/photo.png')
  ),
  const Tag(
    title: singleLife,
    image: AssetImage('assets/images/tags/single_life.png')
  ),
  const Tag(
    title: sport,
    image: AssetImage('assets/images/tags/sport.png')
  ),
  const Tag(
    title: music,
    image: AssetImage('assets/images/tags/music.png')
  )
];