import 'package:meals/models/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/meals_screen.dart';
import 'package:meals/widget/category_grid_item.dart';
import 'package:meals/widget/meal_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context,Category category) {

    final filterMealsData = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();//filter
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              title: category.title,// show page title
              meals: filterMealsData,// show data using final var.... line 13
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        children: [
          // availableCategory.map((category)=>CaterialGridItem(category: category)).toList();
          for (final data in availableCategories)
            CaterialGridItem(
              category: data,
              onSelectCategory: () {
                _selectCategory(context,data);
                print('call to selectcatoey');
              },
            )
        ],
      ),
    );
  }
}
