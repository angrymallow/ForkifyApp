import 'package:ForkifyApp/core/error/failure.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/features/recipe/domain/usecases/search_recipes.dart';
import 'package:ForkifyApp/features/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockGetRecipes extends Mock implements SearchRecipes {}

void main() {
  RecipeBloc bloc;
  MockGetRecipes mockGetRecipes;

  setUp(() {
    mockGetRecipes = MockGetRecipes();
    bloc = RecipeBloc(searchRecipes: mockGetRecipes);
  });

  group('Search Recipe', () {
    test('when use case return network failure should return error state',
        () async {
      when(mockGetRecipes(any))
          .thenAnswer((_) async => Left(ConnectionFailure()));
      final expected = [
        RecipeLoading(),
        RecipeError(CONNECTION_ERROR_MESSAGE),
      ];

      bloc.add(SearchRecipeEvent('pizza'));
      expectLater(bloc, emitsInOrder(expected));
    });

    test(
        'when use case return server failure should return error state and server failure',
        () async {
      when(mockGetRecipes(any)).thenAnswer((_) async => Left(ServerFailure()));

      final expected = [
        RecipeLoading(),
        RecipeError(SERVER_FAILURE_MESSAGE),
      ];

      bloc.add(SearchRecipeEvent('pizza'));
      expectLater(bloc, emitsInOrder(expected));
    });
  });

  group('Recipe Bloc', () {
    final List<Recipe> tRecipes = [
      Recipe(
          recipeId: '47746',
          socialRank: 100.0,
          title: "Best Pizza Dough Ever",
          publisher: "101 Cookbooks",
          imageURL:
              "http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg",
          publisherURL: "http://www.101cookbooks.com",
          sourceURL: "http://www.101cookbooks.com/archives/001199.html"),
      Recipe(
          recipeId: '46956',
          socialRank: 100.0,
          title: "Deep Dish Fruit Pizza",
          publisher: "The Pioneer Woman",
          imageURL:
              "http://forkify-api.herokuapp.com/images/fruitpizza9a19.jpg",
          publisherURL: "http://thepioneerwoman.com",
          sourceURL: "http://thepioneerwoman.com/cooking/2012/01/fruit-pizza/"),
    ];

    blocTest('emits [Loading] [Error] in connection failure',
        build: () {
          when(mockGetRecipes(any))
              .thenAnswer((_) async => Left(ServerFailure()));
          return RecipeBloc(searchRecipes: mockGetRecipes);
        },
        act: (bloc) => bloc.add(SearchRecipeEvent('pizza')),
        expect: [
          RecipeLoading(),
          RecipeError(CONNECTION_ERROR_MESSAGE),
        ]);

    blocTest('emits [Loading] [Error] in server failure',
        build: () {
          when(mockGetRecipes(any))
              .thenAnswer((_) async => Left(ServerFailure()));
          return RecipeBloc(searchRecipes: mockGetRecipes);
        },
        act: (bloc) => bloc.add(SearchRecipeEvent('pizza')),
        expect: [
          RecipeLoading(),
          RecipeError(SERVER_FAILURE_MESSAGE),
        ]);
    blocTest('emits [Loading] [Loaded] when successed',
        build: () {
          when(mockGetRecipes(any)).thenAnswer((_) async => Right(tRecipes));
          return RecipeBloc(searchRecipes: mockGetRecipes);
        },
        act: (bloc) => bloc.add(SearchRecipeEvent('pizza')),
        expect: [
          RecipeLoading(),
          RecipeLoaded(tRecipes),
        ]);
  });
}
