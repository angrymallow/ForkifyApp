import 'package:ForkifyApp/model/recipe_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  group('Parse Recipe', (){
    test('From JSON', () {
      const jsonRaw = '''{"publisher": "101 Cookbooks","title": "Best Pizza Dough Ever","source_url": "http://www.101cookbooks.com/archives/001199.html","recipe_id": "47746","image_url": "http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg","social_rank": 100,"publisher_url": "http://www.101cookbooks.com"}
      ''';
     var recipe = Recipe.fromJSon(jsonDecode(jsonRaw));
     expect(recipe.recipeId, 47746);
     expect(recipe.publisher, '101 Cookbooks');
     expect(recipe.title,'Best Pizza Dough Ever');
     expect(recipe.sourceURL, 'http://www.101cookbooks.com/archives/001199.html');
     expect(recipe.imageURL, 'http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg');
     expect(recipe.socialRank,100);
     expect(recipe.publisherURL, 'http://www.101cookbooks.com');
    });
  });
}