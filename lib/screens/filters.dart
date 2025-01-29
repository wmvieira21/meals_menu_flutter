import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu/provider/filters_provider.dart';
import 'package:meals_menu/widgets/filters/switch_tile_item.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: PopScope<Map<FilterOption, bool>>(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            // Navigator.pop(context, currentFilters); não preciso mais retornar os filtros.. Adicionado controle de estado
            // ref.watch(filtersProvider.notifier).setFilters({
            //   FilterOption.glutterFree: gluttenFreeFilterValue,
            //   FilterOption.lactoseFree: lactoseFreeFilterValue,
            //   FilterOption.vegan: veganFreeFilterValue,
            //   FilterOption.vetegarian: vegetarianFreeFilterValue,
            // });
            return;
          }
        },
        child: Column(
          children: [
            SwitchTileItem(
                tittle: 'Glutten-free',
                subtittle: 'Only includes Gluten-free meals.',
                optionFilter: FilterOption.glutterFree),
            SwitchTileItem(
                tittle: 'Lactose-free',
                subtittle: 'Only includes Lactose-free meals.',
                optionFilter: FilterOption.lactoseFree),
            SwitchTileItem(
                tittle: 'Vegetarian',
                subtittle: 'Only includes Vegetarian meals.',
                optionFilter: FilterOption.vetegarian),
            SwitchTileItem(
                tittle: 'Vegan',
                subtittle: 'Only includes Vegan meals.',
                optionFilter: FilterOption.vegan),
          ],
        ),
      ),
    );
  }
}
