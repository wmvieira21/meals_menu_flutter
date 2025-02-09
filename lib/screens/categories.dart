import 'package:flutter/material.dart';
import 'package:meals_menu/data/dummy_categories.dart';
import 'package:meals_menu/models/category.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/screens/meals.dart';
import 'package:meals_menu/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
        lowerBound: 0,
        upperBound: 1);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // final Function(Meal meal) onToggleFavoriteMeal;
  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMealsByCategory = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
            tittle: category.tittle, meals: filteredMealsByCategory),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      // builder: (context, grid) => Padding(
      //   padding: EdgeInsets.only(
      //     top: 100 - (_animationController.value * 100),
      //   ),
      //   child: grid,
      // ),
      builder: (context, child) => SlideTransition(
        // position: _animationController.drive(
        position: Tween(
          begin: const Offset(0.3, 0),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: child,
      ),
    );
  }
}
