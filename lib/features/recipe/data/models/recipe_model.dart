import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class RecipeModel extends Recipe {
  final int recipeId;
  final double socialRank;
  final String title;
  final String publisher;
  final String imageURL;
  final String publisherURL;
  final String sourceURL;
  RecipeModel({
    @required this.recipeId,
    @required this.socialRank,
    @required this.title,
    @required this.publisher,
    @required this.imageURL,
    @required this.publisherURL,
    @required this.sourceURL,
  });


}
