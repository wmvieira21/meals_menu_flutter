import 'package:flutter/material.dart';
import 'package:meals_menu/data/dummy_categories.dart';
import 'package:meals_menu/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
            return CategoryGridItem(category: category);
          })
        ],
      ),
    );
  }
}
