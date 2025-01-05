import 'package:flutter/material.dart';
import 'package:meals/models/meals_model.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/meals_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

// use for favorite ...................
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisteMeal = _favoriteMeals.contains(meal);

    setState(() {
      if (isExisteMeal) {
        _favoriteMeals.remove(meal);
        _showInfoMessage("Remove your Favorite");
      } else {
        _favoriteMeals.add(meal);
        _showInfoMessage("Add your favorite");
      }
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onSelectFavoriteItem: _toggleMealFavoriteStatus,
    );
    var activePageTitle = 'categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
          onSelectFavoriteItem: _toggleMealFavoriteStatus,
          meals: _favoriteMeals);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
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
