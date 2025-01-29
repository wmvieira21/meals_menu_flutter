import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu/provider/favorites_provider.dart';
import 'package:meals_menu/provider/filters_provider.dart';
import 'package:meals_menu/screens/categories.dart';
import 'package:meals_menu/screens/filters.dart';
import 'package:meals_menu/screens/meals.dart';
import 'package:meals_menu/widgets/main_drawer.dart';

// const kInitialValuesFilters = {
//   FilterOption.glutterFree: false,
//   FilterOption.lactoseFree: false,
//   FilterOption.vegan: false,
//   FilterOption.vetegarian: false,
// };

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _TabsScreen();
  }
}

class _TabsScreen extends ConsumerState<TabsScreen> {
  // final List<Meal> favoritesMeals = [];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // void _onToggleFavoriteMeal(Meal meal) {
  //   setState(() {
  //     if (favoritesMeals.contains(meal)) {
  //       favoritesMeals.remove(meal);
  //       _showInfoMessage('Meal removed from favorites');
  //     } else {
  //       favoritesMeals.add(meal);
  //       _showInfoMessage('Meal marked as a favorite');
  //     }
  //     meal.isFavorite = !meal.isFavorite;
  //   });
  // }

  void _setScreen(String identifier) {
    Navigator.of(context).pop();

    if (identifier == 'meals') {
      if (_selectedPageIndex == 1) {
        _selectPage(0);
      }
    } else {
      // Navigator.push<Map<FilterOption, bool>>(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => FiltersScreen(currentFilters: _selectedFilters),
      //   ),
      // ).then((filters) {
      //   setState(() {
      //     _selectedFilters = filters ?? kInitialValuesFilters;
      //   });
      // });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FiltersScreen(),
        ),
      );
    }
  }

  // List<Meal> filteredMeals(List<Meal> meals) {
  //   final selectedFilters = ref.watch(filtersProvider);
  //   return meals.where((meal) {
  //     if (selectedFilters[FilterOption.glutterFree]! && !meal.isGlutenFree) {
  //       return false;
  //     }
  //     if (selectedFilters[FilterOption.lactoseFree]! && !meal.isLactoseFree) {
  //       return false;
  //     }
  //     if (selectedFilters[FilterOption.vegan]! && !meal.isVegan) {
  //       return false;
  //     }
  //     if (selectedFilters[FilterOption.vetegarian]! && !meal.isVegetarian) {
  //       return false;
  //     }
  //     return true;
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final filteredMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(availableMeals: filteredMeals);
    String activePageTittle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: favoriteMeals);
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
