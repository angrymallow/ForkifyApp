import 'package:ForkifyApp/core/error/failure.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe_ingredient.dart';
import 'package:dartz/dartz.dart';

abstract class RecipeRepository {
  Future<Either<Failure, List<Recipe>>> getRecipes(String keyword);
  Future<Either<Failure, RecipeIngredient>> getIngredient(String recipeId);
}