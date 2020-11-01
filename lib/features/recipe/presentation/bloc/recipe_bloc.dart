import 'dart:async';

import 'package:ForkifyApp/core/error/failure.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:ForkifyApp/features/recipe/domain/usecases/search_recipes.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

const CONNECTION_ERROR_MESSAGE = 'Connection Error';
const SERVER_FAILURE_MESSAGE = 'Recipe can\'t be retrieved';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final SearchRecipes searchRecipes;

  RecipeBloc({
    @required this.searchRecipes,
  }) : super(RecipeInitial());

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ConnectionFailure:
        return CONNECTION_ERROR_MESSAGE;
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }

  @override
  Stream<RecipeState> mapEventToState(
    RecipeEvent event,
  ) async* {
    if (event is SearchRecipeEvent) {
      yield RecipeLoading();
      final recipes = await searchRecipes(event.keyword);
      yield recipes.fold(
          (failure) => RecipeError(_mapFailureToMessage(failure)),
          (recipes) => RecipeLoaded(recipes));
    }
  }
}
