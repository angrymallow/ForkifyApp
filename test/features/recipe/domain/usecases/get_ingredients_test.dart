import 'package:ForkifyApp/features/recipe/domain/entities/ingredient.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe_ingredient.dart';
import 'package:ForkifyApp/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:ForkifyApp/features/recipe/domain/usecases/get_ingredients.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRecipeRepository extends Mock implements RecipeRepository {}

void main() {
  MockRecipeRepository mockRecipeRepository;
  GetIngredients usecase;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    usecase = GetIngredients(mockRecipeRepository);
  });

  final tRecipeId = '123';
  final tRecipeIngredient = RecipeIngredient(
    recipe: Recipe(
      recipeId: 1,
      socialRank: 1.0,
      title: "Test Title",
      publisher: 'Test Publisher',
      imageURL: 'Test Image URL',
      publisherURL: 'Test Publisher URL',
      sourceURL: 'Test source URL',
    ),
    ingredients: [
      Ingredient(
        count: 1,
        unit: 'tsb',
        ingredient: 'test ingredient',
      ),
    ],
  );

  group('Get Ingredients', () {
    //Arrange
    test('Should return ingredients when called', () async {
      when(mockRecipeRepository.getIngredient(any))
          .thenAnswer((_) async => Right(tRecipeIngredient));
      // Act
      final result = await usecase(tRecipeId);
      // Assert
      expect(result, Right(tRecipeIngredient));
      verify(mockRecipeRepository.getIngredient(tRecipeId));
      verifyNoMoreInteractions(mockRecipeRepository);
    });
  });
}
