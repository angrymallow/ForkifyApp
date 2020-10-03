import 'package:flutter_test/flutter_test.dart';
import 'package:ForkifyApp/model/recipe_model.dart';
import 'dart:convert';

void main() {
 group('Parse Recipe Search', () {
   
   String jsonRaw;
   RecipeIngredient recipeIngredient;
   setUp((){
     jsonRaw = '''{"recipe":{"publisher":"101 Cookbooks","ingredients":["4 1/2 cups (20.25 ounces) unbleached high-gluten, bread, or all-purpose flour, chilled","1 3/4 (.44 ounce) teaspoons salt","1 teaspoon (.11 ounce) instant yeast","1/4 cup (2 ounces) olive oil (optional)","1 3/4 cups (14 ounces) water, ice cold (40F)","Semolina flour OR cornmeal for dusting"],"source_url":"http://www.101cookbooks.com/archives/001199.html","recipe_id":"47746","image_url":"http://forkify-api.herokuapp.com/images/best_pizza_dough_recipe1b20.jpg","social_rank":100,"publisher_url":"http://www.101cookbooks.com","title":"Best Pizza Dough Ever"}}''';
    //  print(jsonDecode(jsonRaw));
     recipeIngredient = RecipeIngredient.fromJson(jsonDecode(jsonRaw));
   });
   test('Recipe should have value', (){
      expect(recipeIngredient.recipe.recipeId , 47746);
   });
   test('Ingredients length should be 6', (){
     expect(recipeIngredient.ingredients.length, 6);
   });
   test('Serving time is correct', (){
     expect(recipeIngredient.servingTime, 30);   
   });
    test('Serving is 4', (){
      expect(recipeIngredient.serving, 4);
    });
 }); 
}