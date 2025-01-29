import 'package:flutter_riverpod/flutter_riverpod.dart';

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
