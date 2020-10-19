import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Recipe extends Equatable {
  final String recipeId;
  final double socialRank;
  final String title;
  final String publisher;
  final String imageURL;
  final String publisherURL;
  final String sourceURL;
  Recipe({
    @required this.recipeId,
    @required this.socialRank,
    @required this.title,
    @required this.publisher,
    @required this.imageURL,
    @required this.publisherURL,
    @required this.sourceURL,
  });

  @override
  List<Object> get props => [recipeId, socialRank, title, publisher, imageURL, publisherURL, sourceURL];
}
