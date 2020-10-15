import 'package:ForkifyApp/features/recipe/data/models/recipe_model.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Recipe Modek', () {
    final tRecipe = RecipeModel(
      recipeId: 1,
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
}
