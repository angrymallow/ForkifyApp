import 'dart:convert';

import 'package:ForkifyApp/features/recipe/dataaccess/models/recipe_ingredient_model.dart';
import 'package:ForkifyApp/model/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> searchRecipe(String keyword);
  Future<RecipeIngredient> searchIngredient(String recipeId);
}
