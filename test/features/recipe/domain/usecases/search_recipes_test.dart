import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/features/recipe/domain/repositories/recipe_repository.dart';
import 'package:ForkifyApp/features/recipe/domain/usecases/search_recipes.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRecipeRepository extends Mock implements RecipeRepository {}

void main() {
  SearchRecipes usecase;
  MockRecipeRepository mockRecipeRepository;

  setUp(() {
    mockRecipeRepository = MockRecipeRepository();
    usecase = SearchRecipes(mockRecipeRepository);
  });

  final tKeyword = 'pizza';
  final List<Recipe> tRecipes = List.from([
    Recipe(
      recipeId: 1,
      socialRank: 1.0,
      title: "Test Title",
      publisher: 'Test Publisher',
      imageURL: 'Test Image URL',
      publisherURL: 'Test Publisher URL',
      sourceURL: 'Test source URL',
    ),
  ]);

  test('Should return recipes from the repository', () async {
    when(mockRecipeRepository.getRecipes(any))
        .thenAnswer((_) async => Right(tRecipes));
    final result = await usecase(tKeyword);
    expect(result, Right(tRecipes));

    verify(mockRecipeRepository.getRecipes(tKeyword));
    verifyNoMoreInteractions(mockRecipeRepository);
  });
}
