import 'package:ForkifyApp/core/error/exception.dart';
import 'package:ForkifyApp/core/error/failure.dart';
import 'package:ForkifyApp/core/network/network_info.dart';
import 'package:ForkifyApp/features/recipe/data/datasource/recipe_data_source.dart';
import 'package:ForkifyApp/features/recipe/data/models/recipe_model.dart';
import 'package:ForkifyApp/features/recipe/data/repositories/recipe_repository_impl.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRecipeDataSource extends Mock implements RecipeDataSource {}

class MockNetWorkfInfo extends Mock implements NetworkInfo {}

void main() {
  MockRecipeDataSource mockRecipeDataSource;
  MockNetWorkfInfo mockNetWorkfInfo;
  RecipeRepositoryImpl repository;

  setUp(() {
    mockRecipeDataSource = MockRecipeDataSource();
    mockNetWorkfInfo = MockNetWorkfInfo();
    repository = RecipeRepositoryImpl(
      dataSource: mockRecipeDataSource,
      networkInfo: mockNetWorkfInfo,
    );
  });

  group('Recipe Repository', () {
    final List<RecipeModel> tRecipes = [
      RecipeModel(
          recipeId: '47746',
          socialRank: 100.0,
          title: "Best Pizza Dough Ever",
          publisher: "101 Cookbooks",
          imageURL:
              "http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg",
          publisherURL: "http://www.101cookbooks.com",
          sourceURL: "http://www.101cookbooks.com/archives/001199.html"),
      RecipeModel(
          recipeId: '46956',
          socialRank: 100.0,
          title: "Deep Dish Fruit Pizza",
          publisher: "The Pioneer Woman",
          imageURL:
              "http://forkify-api.herokuapp.com/images/fruitpizza9a19.jpg",
          publisherURL: "http://thepioneerwoman.com",
          sourceURL: "http://thepioneerwoman.com/cooking/2012/01/fruit-pizza/"),
    ];
    test('should get the ingredients when the device is online', () async {
      // Arrange
      final String tKeyword = 'pizza';
      when(mockNetWorkfInfo.isConnected).thenAnswer((_) async => true);
      when(mockRecipeDataSource.getRecipes(any))
          .thenAnswer((_) async => tRecipes);

      // Act
      final result = await repository.getRecipes(tKeyword);

      // Assert
      verify(mockNetWorkfInfo.isConnected);
      verify(mockRecipeDataSource.getRecipes(tKeyword));
      expect(result, equals(Right(tRecipes)));
    });

    test('should throw connection failure if the device is not connected',
        () async {
      // Arrange
      final String tKeyword = 'pizza';
      when(mockNetWorkfInfo.isConnected).thenAnswer((_) async => false);

      // Act
      final result = await repository.getRecipes(tKeyword);

      // Assert
      verify(mockNetWorkfInfo.isConnected);
      verifyZeroInteractions(mockRecipeDataSource);
      expect(result, Left(ConnectionFailure()));
    });

    test('should throw server failure if there is an error in the repository',
        () async {
      // Arrange
      final String tKeyword = 'pizza';
      when(mockNetWorkfInfo.isConnected).thenAnswer((_) async => true);
      when(mockRecipeDataSource.getRecipes(any))
          .thenThrow(ServerException());

      // Act
      final result = await repository.getRecipes(tKeyword);

      // Assert
      verify(mockNetWorkfInfo.isConnected);
      verify(mockRecipeDataSource.getRecipes(tKeyword));
      expect(result, Left(ServerFailure()));
    });
  });
}
