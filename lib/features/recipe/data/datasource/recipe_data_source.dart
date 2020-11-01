import 'dart:convert';

import 'package:ForkifyApp/core/error/exception.dart';
import 'package:ForkifyApp/features/recipe/data/models/recipe_ingredient_model.dart';
import 'package:ForkifyApp/features/recipe/data/models/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  Future<List<RecipeModel>> getRecipes(String keyword) async {
    final response = await client.get(
        'https://forkify-api.herokuapp.com/api/search',
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final recipeMap = jsonDecode(response.body);
      final result = List<Map<String, dynamic>>.from(recipeMap['recipes'])
          .map((model) => RecipeModel.fromJson(model))
          .toList();
      return result;
    } else {
      throw ServerException();
    }
  }
}
