import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/provider/favorites_provider.dart';

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final Meal meal;
  // final Function(Meal meal) onToggleFavoriteMeal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final bool isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.tittle),
        actions: [
          IconButton(
            onPressed: () {
              final isMealAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .onToggleMealFavoriteStatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'This meal has been ${isMealAdded ? 'added' : 'removed'} as favorite!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                    turns: Tween<double>(begin: 0.5, end: 1).animate(animation),
                    child: child);
              },
              child: Icon(
                (isFavorite ? Icons.star : Icons.star_border),
                key: ValueKey(isFavorite),
              ),
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
              child: Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                  height: 300,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/image_not_found.png',
                      fit: BoxFit.cover,
                      height: 200,
                      width: double.infinity,
                    );
                  },
                ),
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
