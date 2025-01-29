import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/provider/meals_provider.dart';

enum FilterOption { glutterFree, lactoseFree, vetegarian, vegan }

class FiltersNotifier extends StateNotifier<Map<FilterOption, bool>> {
  FiltersNotifier()
      : super({
          FilterOption.glutterFree: false,
          FilterOption.lactoseFree: false,
          FilterOption.vegan: false,
          FilterOption.vetegarian: false,
        });

  void setFilters(Map<FilterOption, bool> filters) {
    state = filters;
  }

  void setFilter(FilterOption filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<FilterOption, bool>>(
        (ref) => FiltersNotifier());

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
    if (selectedFilters[FilterOption.glutterFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[FilterOption.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilters[FilterOption.vegan]! && !meal.isVegan) {
      return false;
    }
    if (selectedFilters[FilterOption.vetegarian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
