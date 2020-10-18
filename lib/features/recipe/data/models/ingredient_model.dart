import 'package:ForkifyApp/features/recipe/domain/entities/ingredient.dart';
import 'package:meta/meta.dart';

class IngredientModel extends Ingredient {
  final double count;
  final String unit;
  final String ingredient;

  IngredientModel({
    @required this.count,
    @required this.unit,
    @required this.ingredient,
  });

  factory IngredientModel.fromRaw(String raw) {
    double _count;
    String _unit;
    String _ingredient;

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

    double _evaluateDivision(String expression) {
      var nums = expression.toString().split('/');
      int dividend = int.tryParse(nums[0]);
      int divisor = int.tryParse(nums[1]);
      double quotient = dividend / divisor;
      return quotient;
    }

    double getUnitValue(List<String> ingredientsInfo) {
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
      _count = getUnitValue(arrIng.sublist(0, unitInd));
      _unit = arrIng[unitInd];
      _ingredient = arrIng.sublist(unitInd + 1).join(' ').trim();
    } else {
      // When there is a count but there's no unit
      if (double.tryParse(arrIng[0]) != null) {
        _count = getUnitValue(arrIng.sublist(0));
        _unit = '';
        _ingredient = arrIng.sublist(1).join(' ').trim();
      }
      // No Unit and No Count just ingredients :) count is default to 1 
      else if (unitInd == -1) {
        _count = 1;
        _unit = '';
        _ingredient = rawIng;
      }
    }

    return IngredientModel(count: _count, unit: _unit, ingredient: _ingredient);
  }
}
