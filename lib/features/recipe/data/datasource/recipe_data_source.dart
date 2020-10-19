import 'package:ForkifyApp/features/recipe/data/models/recipe_ingredient_model.dart';
import 'package:ForkifyApp/features/recipe/data/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const RECIPE_API_ENDPOINT = 'https://forkify-api.herokuapp.com/api/search';

abstract class RecipeDataSource {
  Future<List<RecipeModel>> getRecipes(String keyword) {}
  Future<List<RecipeIngredientModel>> getIngredient(String recipeId) {}
}

class RecipeDataSourceImpl implements RecipeDataSource {
  final http.Client client;

  RecipeDataSourceImpl({@required this.client});

  @override
  Future<List<RecipeIngredientModel>> getIngredient(String recipeId) {
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> getRecipes(String keyword) {
    final response = await client.get(RECIPE_API_ENDPOINT,)
  }
}
