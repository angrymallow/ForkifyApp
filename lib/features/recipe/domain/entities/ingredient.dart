import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Ingredient extends Equatable {
  final double count;
  final String unit;
  final String ingredient;
  Ingredient({
    @required this.count,
    @required this.unit,
    @required this.ingredient,
  });
  @override
  List<Object> get props => [count, unit, ingredient];
}
