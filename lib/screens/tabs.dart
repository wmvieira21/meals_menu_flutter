import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/categories.dart';
import 'package:meals_menu/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> favoritesMeals = [];

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _onToggleFavoriteMeal(Meal meal) {
    setState(() {
      if (favoritesMeals.contains(meal)) {
        favoritesMeals.remove(meal);
      } else {
        favoritesMeals.add(meal);
      }
      meal.isFavorite = !meal.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =
        CategoriesScreen(onToggleFavoriteMeal: _onToggleFavoriteMeal);
    String activePageTittle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: favoritesMeals,
        onToggleFavoriteMeal: _onToggleFavoriteMeal,
      );
      activePageTittle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTittle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.set_meal), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ]),
    );
  }
}
