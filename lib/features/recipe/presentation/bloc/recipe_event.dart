part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class SearchRecipeEvent extends RecipeEvent {
  final String keyword;
  SearchRecipeEvent(this.keyword);
}

class GetIngredienEvent extends RecipeEvent {
  final String recipeId;
  GetIngredienEvent(this.recipeId);
}
