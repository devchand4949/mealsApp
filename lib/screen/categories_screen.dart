import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screen/meals_screen.dart';
import 'package:meals/widget/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsScreen(
              title: 'Meal',
              meals: [],
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pick your categories'),
      ),
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
                _selectCategory(context);
                print('call to selectcatoey');
              },
            )
        ],
      ),
    );
  }
}
