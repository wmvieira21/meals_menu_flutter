import 'package:flutter/material.dart';
import 'package:meals_menu/widgets/filters/switch_tile_item.dart';

enum FilterOption { glutterFree, lactoseFree, vetegarian, vegan }

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<FilterOption, bool> currentFilters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: PopScope<Map<FilterOption, bool>>(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {
            Navigator.pop(context, currentFilters);
          }
        },
        child: Column(
          children: [
            SwitchTileItem(
              tittle: 'Glutten-free',
              subtittle: 'Only includes Gluten-free meals.',
              defaultValue: currentFilters[FilterOption.glutterFree]!,
              onCheckingFilterOption: (isChecked) {
                currentFilters[FilterOption.glutterFree] = isChecked;
              },
            ),
            SwitchTileItem(
              tittle: 'Lactose-free',
              subtittle: 'Only includes Lactose-free meals.',
              defaultValue: currentFilters[FilterOption.lactoseFree]!,
              onCheckingFilterOption: (isChecked) {
                currentFilters[FilterOption.lactoseFree] = isChecked;
              },
            ),
            SwitchTileItem(
              tittle: 'Vegetarian',
              subtittle: 'Only includes Vegetarian meals.',
              defaultValue: currentFilters[FilterOption.vetegarian]!,
              onCheckingFilterOption: (isChecked) {
                currentFilters[FilterOption.vetegarian] = isChecked;
              },
            ),
            SwitchTileItem(
              tittle: 'Vegan',
              subtittle: 'Only includes Vegan meals.',
              defaultValue: currentFilters[FilterOption.vegan]!,
              onCheckingFilterOption: (isChecked) {
                currentFilters[FilterOption.vegan] = isChecked;
              },
            ),
          ],
        ),
      ),
    );
  }
}
