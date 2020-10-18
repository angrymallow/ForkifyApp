import 'dart:convert';

import 'package:ForkifyApp/features/recipe/data/models/ingredient_model.dart';
import 'package:ForkifyApp/features/recipe/domain/entities/ingredient.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('Ingredient Model', () {
    // Test model if instance of the entity
    String _getRawFromFixture(String filename) {
      return jsonDecode(fixture(filename))['ingredient'];
    }

    test('Should an instance of the Ingredient Entity', () {
      // Arrange and Act
      final tIngredient =
          Ingredient(count: 1, ingredient: 'test', unit: 'test unit');

      // Assert
      expect(tIngredient, isA<Ingredient>());
    });

    group('from Raw', () {
      test('Should ingredient and unit is lower cased', () {
        // Arrange
        final tIngredientRaw = '2 Cups Soysauce';
        final tIngredient =
            IngredientModel(count: 2, unit: 'cup', ingredient: 'soysauce');

        // Act
        final result = IngredientModel.fromRaw(tIngredientRaw);

        print(result.unit);

        // Assert
        expect(result, tIngredient);
      });

      test('Should shortened the unit that is included in the unit list', () {
        // Arrange
        final tIngredientRaw = _getRawFromFixture('ingredient.json');
        final tShortenedUnit = 'cup';

        // Act
        final result = IngredientModel.fromRaw(tIngredientRaw);

        // Assert
        expect(result.unit, tShortenedUnit);
      });

      test('Should replace the fraction into a double format', () {
        // Arrange
        final tIngredientRaw = _getRawFromFixture('ingredient.json');
        final tExpectedCount = 4.5;

        // Act
        final result = IngredientModel.fromRaw(tIngredientRaw);

        // Assert
        expect(result.count, tExpectedCount);
      });

      test('Should has unit and count', () {
        // Arrange
        final tIngdientRaw = _getRawFromFixture('ingredient.json');
        final tCount = 4.5;
        final tUnit = 'cup';

        // Act
        final result = IngredientModel.fromRaw(tIngdientRaw);

        // Assert
        expect(result.count, tCount);
        expect(result.unit, tUnit);
      });

      test('Should has count and no unit', () {
        // Arrange
        final tIngredientRaw = _getRawFromFixture('ingredient_no_unit.json');

        // Act
        final result = IngredientModel.fromRaw(tIngredientRaw);

        // Assert
        expect(result.count, 3);
        expect(result.unit, isEmpty);
      });

      test('Should has no count and unit just ingredient', () {
        // Arrange
        final tIngredientRaw =
            _getRawFromFixture('ingredient_no_unit_no_count.json');
        final tIngredient = 'semolina flour or cornmeal for dusting';

        // Act
        final result = IngredientModel.fromRaw(tIngredientRaw);

        // Assert
        expect(result.ingredient, tIngredient);
        expect(result.count, 1);
        expect(result.unit, isEmpty);
      });

      test('Should parse the ingredient', () {
        // Arrange
        final tRawIngredient = _getRawFromFixture('ingredient.json');
        final tIngredient = IngredientModel(
          count: 4.5,
          unit: 'cup',
          ingredient:
              'unbleached high-gluten, bread, or all-purpose flour, chilled',
        );

        // Act
        final result = IngredientModel.fromRaw(tRawIngredient);

        // Assert
        expect(result, tIngredient);
      });
    });
  });
}
