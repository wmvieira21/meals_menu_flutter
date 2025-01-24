import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/meal_details.dart';
import 'package:meals_menu/widgets/meals/meal_item.dart';
import 'package:meals_menu/widgets/meals/no_meals_found.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.tittle,
      required this.meals,
      required this.onToggleFavoriteMeal});

  final String? tittle;
  final List<Meal> meals;
  final Function(Meal meal) onToggleFavoriteMeal;

  Widget _getMainContent(BuildContext context) {
    if (meals.isEmpty) {
      return NoMealsFound();
    }
    return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
              meal: meals[index],
              onSelectMeal: (meal) => _showMealDetailsScreen(context, meal));
        });
  }

  void _showMealDetailsScreen(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return MealDetailsScreen(
          meal: meal,
          onToggleFavoriteMeal: onToggleFavoriteMeal,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (tittle == null) {
      return _getMainContent(context);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(tittle!),
        ),
        body: _getMainContent(context));
  }
}
