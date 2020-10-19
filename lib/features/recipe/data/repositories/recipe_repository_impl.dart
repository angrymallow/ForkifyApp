import 'package:ForkifyApp/core/error/exception.dart';
import 'package:ForkifyApp/core/network/network_info.dart';
import 'package:ForkifyApp/features/recipe/data/datasource/recipe_data_source.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe_ingredient.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/core/error/failure.dart';
import 'package:ForkifyApp/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  
  final RecipeDataSource dataSource;
  final NetworkInfo networkInfo;

  RecipeRepositoryImpl({@required this.dataSource, @required this.networkInfo});
  
  @override
  Future<Either<Failure, RecipeIngredient>> getIngredient(String recipeId) {
  
  }
  
  @override
  Future<Either<Failure, List<Recipe>>> getRecipes(String keyword) async {
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(ConnectionFailure());
    }
    try {
      final result = await  dataSource.getRecipes(keyword);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}