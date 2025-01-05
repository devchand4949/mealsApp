import 'package:flutter/material.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/screen/meal_detail_screen.dart';
import 'package:meals/widget/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals,required this.onSelectFavoriteItem});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onSelectFavoriteItem;


  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MealDetailScreen(meal: meal,onSelectFavoriteItem: onSelectFavoriteItem,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Data not found",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Try select different category...",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: ((context, Index) => MealItem(
                meal: meals[Index],
                onSelectMeal: selectMeal,
              )));
      //selectMeal is void function , define above in this page
    }

    if(title == null){
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
