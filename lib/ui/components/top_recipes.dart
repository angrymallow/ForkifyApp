import 'package:ForkifyApp/features/recipe/domain/entities/recipe.dart';
import 'package:flutter/material.dart';
import 'package:ForkifyApp/ui/details/recipe_details_page.dart';
import 'package:ForkifyApp/features/recipe/presentation/widgets/recipe_summary.dart';

class TopRecipes extends StatelessWidget {
  const TopRecipes({
    Key key,
    @required this.topRecipes,
  }) : super(key: key);

  final List<Recipe> topRecipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 30),
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          Text(
            'MOST LOVED RECIPES',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Column(
            children: this
                .topRecipes
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return RecipeDeatilsPage(
                          title: e.title,
                          imageURL: e.imageURL,
                          isLiked: true,
                        );
                      }));
                    },
                    child: new Container(
                      margin: EdgeInsets.only(top: 20),
                      child: RecipeSummary(
                        title: e.title,
                        publisher: e.publisher,
                        likes: 1,
                        imageURL: e.imageURL,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
