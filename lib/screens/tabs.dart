import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/categories.dart';
import 'package:meals_menu/screens/filters.dart';
import 'package:meals_menu/screens/meals.dart';
import 'package:meals_menu/widgets/main_drawer.dart';

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
        _showInfoMessage('Meal removed from favorites');
      } else {
        favoritesMeals.add(meal);
        _showInfoMessage('Meal marked as a favorite');
      }
      meal.isFavorite = !meal.isFavorite;
    });
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'meals') {
      if (_selectedPageIndex == 1) {
        _selectPage(0);
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FiltersScreen()),
      );
    }
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
      drawer: MainDrawer(
        onSetScreenDrawer: (identifier) => _setScreen(identifier),
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
