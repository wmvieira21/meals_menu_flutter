import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/widgets/meals/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final Function(Meal meal) onSelectMeal;

  String _getEnumFormattedText(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      key: ValueKey(meal),
      child: InkWell(
        splashColor: Theme.of(context).colorScheme.onErrorContainer,
        onTap: () => onSelectMeal(meal),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                color: const Color.fromARGB(144, 0, 0, 0),
                child: Column(
                  spacing: 12,
                  children: [
                    Text(
                      meal.tittle,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 12,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: '${meal.duration} min'),
                        MealItemTrait(
                          icon: Icons.work,
                          label: _getEnumFormattedText(meal.complexity.name),
                        ),
                        MealItemTrait(
                          icon: Icons.attach_money,
                          label: _getEnumFormattedText(meal.affordability.name),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
