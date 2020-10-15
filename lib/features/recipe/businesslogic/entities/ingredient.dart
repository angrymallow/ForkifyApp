import 'package:meta/meta.dart';

abstract class Ingredient {
  double count;
  String unit, ingredient;
  List<String> test;
  Ingredient(
      {@required this.count, @required this.unit, @required this.ingredient});
}
