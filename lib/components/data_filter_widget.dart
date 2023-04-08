import 'package:contact_app/utils/data_view.dart';
import 'package:flutter/material.dart';

class DataFilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        iconEnabledColor: theme.colorScheme.tertiary,
        value: contactGroup.first.src,
        isExpanded: true,
        items: contactGroup
            .map(
              (item) => DropdownMenuItem<String>(
                value: item.src!,
                child: ListTile(
                  title: Text(item.src!),
                  subtitle: item.address! != '' ? Text(item.address!) : null,
                  trailing: Text(item.amount!),
                  dense: true,
                  iconColor: theme.colorScheme.primary,
                  selectedColor: theme.colorScheme.primary,
                  selectedTileColor: Colors.transparent,
                ),
              ),
            )
            .toList(),
        onChanged: (val) {},
      ),
    );
  }
}
