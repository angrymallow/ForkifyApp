import 'dart:convert';

import 'package:ForkifyApp/features/recipe/data/models/recipe_model.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tRecipeModel = RecipeModel(
    recipeId: '47746',
    socialRank: 100.0,
    title: "Best Pizza Dough Ever",
    publisher: "101 Cookbooks",
    imageURL:
        "http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg",
    publisherURL: "http://www.101cookbooks.com",
    sourceURL: "http://www.101cookbooks.com/archives/001199.html",
  );

  group('Recipe Model', () {
    final tRecipe = RecipeModel(
      recipeId: '1',
      socialRank: 1.0,
      title: "Test Title",
      publisher: 'Test Publisher',
      imageURL: 'Test Image URL',
      publisherURL: 'Test Publisher URL',
      sourceURL: 'Test source URL',
    );
    test('should be a subclass of Recipe Entity', () {
      expect(tRecipe, isA<Recipe>());
    });
  });

  group('from Json', () {
    test('should return recipe model from json', () {
      //Arrange
      final jsonMap = jsonDecode(fixture('recipe.json'));
      //Act
      final result = RecipeModel.fromJson(jsonMap);
      print(result.recipeId);
      //Assert
      expect(result, tRecipeModel);
    });
  });
}
