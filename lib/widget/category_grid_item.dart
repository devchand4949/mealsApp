import 'package:flutter/material.dart';
import 'package:meals/models/categoryModel.dart';
import 'package:meals/screen/categories_screen.dart';

class CaterialGridItem extends StatelessWidget {
  const CaterialGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  final Category category; //use for passing data
  final Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onSelectCategory,//pass function
      splashColor: Theme.of(context).primaryColor, //onclick effect
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
