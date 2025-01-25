import 'package:flutter/material.dart';
import 'package:meals_menu/models/meal.dart';
import 'package:meals_menu/widgets/filters/switch_tile_item.dart';

enum FilterOption { glutterFree, lactoseFree, vetegarian, vegan }

class FiltersScreen extends StatelessWidget {
  FiltersScreen({super.key, required this.filterValues});

  final Map<FilterOption, bool> filterValues;
  Map<FilterOption, bool> filterOptionsCopy = {};

  @override
  Widget build(BuildContext context) {
    filterOptionsCopy.addAll(filterValues);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: PopScope<Map<FilterOption, bool>>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.pop(context, filterOptionsCopy);
          }
        },
        child: Column(
          children: [
            SwitchTileItem(
              tittle: 'Glutten-free',
              subtittle: 'Only includes Gluten-free meals.',
              defaultValue: filterOptionsCopy[FilterOption.glutterFree]!,
              onCheckingFilterOption: (isChecked) {
                filterOptionsCopy[FilterOption.glutterFree] = isChecked;
              },
            ),
            SwitchTileItem(
              tittle: 'Lactose-free',
              subtittle: 'Only includes Lactose-free meals.',
              defaultValue: filterOptionsCopy[FilterOption.lactoseFree]!,
              onCheckingFilterOption: (isChecked) {
                filterOptionsCopy[FilterOption.lactoseFree] = isChecked;
              },
            ),
            SwitchTileItem(
              tittle: 'Vegetarian',
              subtittle: 'Only includes Vegetarian meals.',
              defaultValue: filterOptionsCopy[FilterOption.vetegarian]!,
              onCheckingFilterOption: (isChecked) {
                filterOptionsCopy[FilterOption.vetegarian] = isChecked;
              },
            ),
            SwitchTileItem(
              tittle: 'Vegan',
              subtittle: 'Only includes Vegan meals.',
              defaultValue: filterOptionsCopy[FilterOption.vegan]!,
              onCheckingFilterOption: (isChecked) {
                filterOptionsCopy[FilterOption.vegan] = isChecked;
              },
            ),
          ],
        ),
      ),
    );
  }
}
