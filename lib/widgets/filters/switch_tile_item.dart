import 'package:flutter/material.dart';

class SwitchTileItem extends StatefulWidget {
  SwitchTileItem(
      {super.key,
      required this.tittle,
      required this.subtittle,
      required this.defaultValue,
      required this.onCheckingFilterOption});

  final String tittle;
  final String subtittle;
  final Function(bool isChecked) onCheckingFilterOption;
  bool defaultValue;

  @override
  State<StatefulWidget> createState() {
    return _SwitchTileItem();
  }
}

class _SwitchTileItem extends State<SwitchTileItem> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      key: ValueKey(widget.tittle),
      value: widget.defaultValue,
      onChanged: (ischecked) {
        setState(() {
          widget.defaultValue = ischecked;
        });
        widget.onCheckingFilterOption(widget.defaultValue);
      },
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
