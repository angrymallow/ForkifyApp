import 'package:ForkifyApp/core/error/exception.dart';
import 'package:ForkifyApp/features/recipe/data/datasource/recipe_data_source.dart';
import 'package:ForkifyApp/features/recipe/data/models/recipe_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  RecipeDataSourceImpl dataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RecipeDataSourceImpl(client: mockHttpClient);
  });

  group('Get Recipes', () {
    final jsonRaw = fixture('recipes.json');
    final tKeyword = 'pizza';

    test(
        'should return recipe list when status success and endpoint and headers are correct',
        () async {
      // Arrange
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
            sourceURL:
                "http://thepioneerwoman.com/cooking/2012/01/fruit-pizza/"),
      ];
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(jsonRaw, 200));

      // Act
      final result = await dataSource.getRecipes(tKeyword);

      // Assert
      verify(mockHttpClient.get('https://forkify-api.herokuapp.com/api/search',
          headers: {'Content-Type': 'application/json'}));
      expect(result, tRecipes);
    });
    test(
      'should return Server Exception when the status code is not 200(Success)',
      () {
        // Arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('Something went wrong', 404));

        // Act
        final call = dataSource.getRecipes;

        // Assert
        expect(() => call(tKeyword), throwsA(isA<ServerException>()));
      },
    );
  });
}
