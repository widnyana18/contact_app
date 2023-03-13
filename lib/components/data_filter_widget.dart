import 'package:contact_app/utils/data_view.dart';
import 'package:flutter/material.dart';

class DataFilterWidget extends StatelessWidget {
  final List<ContactSrc> group;
  DataFilterWidget(this.group);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_rounded),
        iconEnabledColor: theme.colorScheme.tertiary,
        value: 'All contact',
        items: group
            .map(
              (item) => DropdownMenuItem<String>(
                value: item.src,
                child: ListTile(
                  // leading: Icon(Icons.navigate_next_rounded),
                  title: Text(item.src!),
                  subtitle:
                      item.address!.isNotEmpty ? Text(item.address!) : null,
                  trailing: item.amount!.isNotEmpty ? Text(item.amount!) : null,
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
