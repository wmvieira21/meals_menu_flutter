import 'package:flutter/material.dart';
import 'package:meals_menu/data/dummy_categories.dart';
import 'package:meals_menu/data/dummy_meals.dart';
import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/meals.dart';
import 'package:meals_menu/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMealListByCategory = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
            tittle: category.tittle, meals: filteredMealListByCategory),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          ...dummyCaterogies.map((category) {
            return CategoryGridItem(
                category: category,
                onSelectCategory: (category) =>
                    _selectCategory(context, category));
          }),
        ],
      ),
    );
  }
}
