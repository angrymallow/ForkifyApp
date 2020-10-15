import 'package:ForkifyApp/features/recipe/domain/entities/ingredient.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RecipeIngredient extends Equatable {
  final Recipe recipe;
  final List<Ingredient> ingredients;
  RecipeIngredient({@required this.recipe, @required this.ingredients});

  @override
  List<Object> get props => [recipe, ingredients];
}

