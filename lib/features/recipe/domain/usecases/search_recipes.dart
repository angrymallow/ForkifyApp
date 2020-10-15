import 'package:ForkifyApp/core/error/failure.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRecipes {
  final RecipeRepository repository;
  SearchRecipes(this.repository);

  Future<Either<Failure, List<Recipe>>>call (String keyword) async{
    return await this.repository.getRecipes(keyword);
  }
}
