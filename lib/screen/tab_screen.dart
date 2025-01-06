import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/filters_screen.dart';
import 'package:meals/screen/meals_screen.dart';
import 'package:meals/widget/main_drawer.dart';
import 'package:meals/providers/meals_provider.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

 const kintialFilters = {
   Filter.glutenFree:false,
   Filter.lactoseFree:false,
   Filter.vegetarian:false,
   Filter.vegan:false,
 };

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedPageIndex = 0;

   // Map<Filter,bool> _selectedFilters = kintialFilters;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text(message)));
  // }

// use for favorite ...................
//   void _toggleMealFavoriteStatus(Meal meal) {
//     final isExisteMeal = _favoriteMeals.contains(meal);
//
//     setState(() {
//       if (isExisteMeal) {
//         _favoriteMeals.remove(meal);
//         _showInfoMessage("Remove your Favorite");
//       } else {
//         _favoriteMeals.add(meal);
//         _showInfoMessage("Add your favorite");
//       }
//     });
//   }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

// filter effect on drawer filter
  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // final result =
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) =>const  FiltersScreen(
            // currentFilter:_selectedFilters,
          )));

      // setState(() {
      //   _selectedFilters = result ?? kintialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {

    final availableMeals = ref.watch(filterMealsProvider);

    Widget activePage = CategoriesScreen(
      // onSelectFavoriteItem: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );
    var activePageTitle = 'categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
          // onSelectFavoriteItem: _toggleMealFavoriteStatus,
          meals: favoriteMeals);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
    );
  }
}
