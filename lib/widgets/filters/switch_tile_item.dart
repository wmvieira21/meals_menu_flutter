import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_menu/provider/filters_provider.dart';

class SwitchTileItem extends ConsumerStatefulWidget {
  const SwitchTileItem(
      {super.key,
      required this.tittle,
      required this.subtittle,
      required this.optionFilter});

  final String tittle;
  final String subtittle;
  final FilterOption optionFilter;
  // final Function(bool isChecked) onCheckingFilterOption;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SwitchTileItem();
  }
}

class _SwitchTileItem extends ConsumerState<SwitchTileItem> {
  @override
  Widget build(BuildContext context) {
    final Map<FilterOption, bool> selectedFilters = ref.watch(filtersProvider);

    return SwitchListTile(
      key: ValueKey(widget.tittle),
      value: selectedFilters[widget.optionFilter]!,
      onChanged: (isChecked) => ref
          .read(filtersProvider.notifier)
          .setFilter(widget.optionFilter, isChecked),
      title: Text(
        widget.tittle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      subtitle: Text(
        widget.subtittle,
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Theme.of(context).colorScheme.onSurface),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    );
  }
}
