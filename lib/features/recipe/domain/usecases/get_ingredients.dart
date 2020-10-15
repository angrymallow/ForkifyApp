import 'package:ForkifyApp/core/error/failure.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe_ingredient.dart';
import 'package:ForkifyApp/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class GetIngredients {
  final RecipeRepository recipeRepository;
  GetIngredients(this.recipeRepository);
  Future<Either<Failure, RecipeIngredient>>call (String recipeId) async {
   return await recipeRepository.getIngredient(recipeId); 
  }
}