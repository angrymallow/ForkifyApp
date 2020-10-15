import 'package:meta/meta.dart';

class Recipe {
  int recipeId;
  double socialRank;
  String title, publisher, imageURL, publisherURL, sourceURL;
  Recipe(
      {@required this.recipeId,
      @required this.title,
      @required this.publisher,
      @required this.imageURL,
      @required this.publisherURL,
      @required this.sourceURL,
      @required this.socialRank});
}
