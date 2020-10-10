import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:ForkifyApp/model/recipe_model.dart';

class SearchApiProvider {
  Client _client = Client();
  Future<List<Recipe>> searchRecipe(String keyword) async {
    final response = await _client
        .get('https://forkify-api.herokuapp.com/api/search?q=' + keyword);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonResponse = response.body;
      List<Recipe> recipes =
          List<Map<String, dynamic>>.from(jsonDecode(jsonResponse)['recipes'])
              .map((model) => Recipe.fromJSon(model))
              .toList();
      return recipes;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<RecipeIngredient> searchIngredient(String recipeId) async {
    final response = await _client
        .get('https://forkify-api.herokuapp.com/api/get?rId=' + recipeId);
    if (response.statusCode == 200) {
      final jsonResponse = response.body;
      final RecipeIngredient result =
          RecipeIngredient.fromJson(jsonDecode(jsonResponse));
      return result;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
