import 'package:flutter/material.dart';
import 'package:meals/screen/categories_screen.dart';
import 'package:meals/screen/meals_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});


  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState((){
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'categories';

    if(_selectedPageIndex == 1){
      activePage = MealsScreen(title: 'Favorites', meals: []);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body:activePage ,
      bottomNavigationBar:BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories',),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites')
        ],
      ),
    );
  }
}
