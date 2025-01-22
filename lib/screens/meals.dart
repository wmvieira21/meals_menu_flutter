import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/widgets/meals/no_meals_found.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.tittle, required this.meals});

  final String tittle;
  final List<Meal> meals;

  Widget getMainContent(BuildContext context) {
    if (meals.isEmpty) {
      return NoMealsFound();
    }
    return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            key: ValueKey(meals),
            child: Text(meals[index].tittle),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(tittle),
        ),
        body: getMainContent(context));
  }
}
