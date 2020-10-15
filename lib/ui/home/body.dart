import 'package:flutter/material.dart';
import 'package:ForkifyApp/model/recipe.dart';
import 'package:ForkifyApp/ui/components/top_recipes.dart';
import 'package:ForkifyApp/ui/components/search_header_sliver.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    Key key,
    @required this.topRecipes,
  }) : super(key: key);

  final List<Recipe> topRecipes;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFFFBDB89), const Color(0xFFF48982)])),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverSearchHeader(
              minExtent: 100.0,
              maxExtent: 300.0,
            ),
          ),
          SliverToBoxAdapter(child: TopRecipes(topRecipes: this.topRecipes)),
        ],
      ),
    );
  }
}
