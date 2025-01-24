import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavoriteMeal});

  final Meal meal;
  final Function(Meal meal) onToggleFavoriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.tittle),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavoriteMeal(meal);
            },
            icon: Icon(
              (meal.isFavorite ? Icons.star : Icons.star_border),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 300,
                width: double.infinity,
              ),
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            const SizedBox(height: 20),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
