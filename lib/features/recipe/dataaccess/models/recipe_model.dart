import 'package:ForkifyApp/features/recipe/businesslogic/entities/recipe.dart';
import 'package:meta/meta.dart';

class RecipeModel extends Recipe {
  RecipeModel({
    @required recipeId,
    @required publisher,
    @required title,
    @required sourceURL,
    @required imageURL,
    @required socialRank,
    @required publisherURL,
  });
  factory RecipeModel.fromJSon(Map<String, dynamic> json) {
    return RecipeModel(
        recipeId: int.tryParse(json['recipe_id']),
        publisher: json['publisher'],
        title: json['title'],
        sourceURL: json['source_url'],
        imageURL: json['image_url'],
        socialRank: double.parse(json['social_rank'].toString()),
        publisherURL: json['publisher_url']);
  }
}
