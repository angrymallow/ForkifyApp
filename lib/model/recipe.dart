import 'package:meta/meta.dart';

class Recipe {
  int recipeId;
  double socialRank;
  String title, publisher, imageURL, publisherURL, sourceURL;
  Recipe(
      {@required this.recipeId,
      @required this.title,
      @required this.publisher,
      @required this.imageURL,
      @required this.publisherURL,
      @required this.sourceURL,
      @required this.socialRank});
}

class Ingredient {
  double count;
  String unit, ingredient;
  List<String> test;
  Ingredient(this.count, this.unit, this.ingredient);
  Ingredient.fromRaw(String raw) {
    _formatRawData(raw);
  }

  void _formatRawData(String raw) {
    String rawIng = raw.toLowerCase();
    const unitsLong = [
      'tablespoons',
      'tablesppon',
      'ounces',
      'ounce',
      'teaspoons',
      'teaspoon',
      'cups',
      'pounds'
    ];
    const unitsShort = [
      'tbsp',
      'tbsp',
      'oz',
      'oz',
      'tsp',
      'tsp',
      'cup',
      'pound'
    ];
    // Replace the units from API into the app standard units
    for (var i = 0; i < unitsLong.length; i++) {
      rawIng = rawIng.replaceAll(unitsLong[i], unitsShort[i]);
    }

    // Remove all parenthesis
    rawIng = rawIng.replaceAllMapped(new RegExp(r'\([^)]*\)'), (match) {
      return '';
    });
    var arrIng = rawIng.split(' ');
    int unitInd = -1;

    for (var i = 0; i < unitsShort.length; i++) {
      if (arrIng.contains(unitsShort[i])) {
        unitInd = arrIng.indexOf(unitsShort[i]);
      }
    }

    // If there is a unit
    if (unitInd > -1) {
      this.count = _getUnitValue(arrIng.sublist(0, unitInd));
      this.unit = arrIng[unitInd];
      this.ingredient = arrIng.sublist(unitInd + 1).join(' ').trim();
    } else {
      // When there is a count but there's no unit
      if (double.tryParse(arrIng[0]) != null) {
        this.count = _getUnitValue(arrIng.sublist(0));
        this.unit = '';
        this.ingredient = arrIng.sublist(1).join(' ').trim();
      }
      // No Unit and No Count just ingredients :)
      else if (unitInd == -1) {
        this.count = 1;
        this.unit = '';
        this.ingredient = rawIng;
      }
    }
  }

  double _getUnitValue(List<String> ingredientsInfo) {
    double unitNum = 0;
    for (var i = 0; i < ingredientsInfo.length; i++) {
      int unitCount = int.tryParse(ingredientsInfo[i]);
      if (unitCount != null) {
        unitNum += unitCount;
      }
      if (ingredientsInfo[i].toString().contains('/')) {
        unitNum += _evaluateDivision(ingredientsInfo[i]);
      }
    }
    return unitNum;
  }

  double _evaluateDivision(String expression) {
    var nums = expression.toString().split('/');
    int dividend = int.tryParse(nums[0]);
    int divisor = int.tryParse(nums[1]);
    double quotient = dividend / divisor;
    return quotient;
  }
}

class RecipeIngredient {
  Recipe recipe;
  bool isLiked;
  int serving, servingTime;
  List<Ingredient> ingredients;

  RecipeIngredient.fromJson(Map<String, dynamic> json) {
    this.recipe = Recipe.fromJSon(json['recipe']);
    _parseIngredient(json['recipe']);
    _calcServingTime();
    _calcServingCount();
  }

  void _parseIngredient(Map<String, dynamic> ingredientRaw) {
    this.ingredients = List<String>.from(ingredientRaw['ingredients'])
        .map((e) => Ingredient.fromRaw(e))
        .toList();
  }

  void _calcServingTime() {
    if (this.ingredients != null) {
      this.servingTime = (this.ingredients.length ~/ 3) * 15;
    } else {
      this.servingTime = 0;
    }
  }

  void _calcServingCount() {
    this.serving = 4;
  }
}
