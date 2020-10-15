import 'package:flutter_test/flutter_test.dart';
import 'package:ForkifyApp/model/recipe.dart';

void main() {
  group('Parse Ingredient', () {
    test('with Unit and Count', () {
      const raw =
          '4 1/2 cups (20.25 ounces) unbleached high-gluten, bread, or all-purpose flour, chilled';

      final ingredient = Ingredient.fromRaw(raw);
      expect(ingredient.count, 4.50);
      expect(ingredient.unit, 'cup');
      expect(ingredient.ingredient,
          'unbleached high-gluten, bread, or all-purpose flour, chilled');
    });

    test('without Unit and with Count', () {
      const raw = '4 unbleached high-gluten';

      final ingredient = Ingredient.fromRaw(raw);
      expect(ingredient.count, 4.0);
      expect(ingredient.unit, '');
      expect(ingredient.ingredient, 'unbleached high-gluten');
    });

    test('without Unit and without Count', () {
      const raw =
          'unbleached high-gluten, bread, or all-purpose flour, chilled';

      final ingredient = Ingredient.fromRaw(raw);
      expect(ingredient.count, 1.0);
      expect(ingredient.unit, '');
      expect(ingredient.ingredient,
          'unbleached high-gluten, bread, or all-purpose flour, chilled');
    });
  });
}
