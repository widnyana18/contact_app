import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class ContactUserTile extends StatelessWidget {
  final String? name;
  ContactUserTile({this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: randomAvatar(
          DateTime.now().toIso8601String(),
          height: 36,
          width: 36,
        ),
      ),
      title: Text(name!),
      onTap: () {},
    );
  }
}

class ContactSusTile extends StatelessWidget {
  final String? tag;
  ContactSusTile({this.tag});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      // width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 16.0),
      color: Color(0xFFF3F4F5),
      alignment: Alignment.centerLeft,
      child: Text(
        '$tag',
        softWrap: false,
        style: theme.textTheme.bodySmall!
          ..copyWith(color: theme.colorScheme.tertiary),
      ),
    );
  }
}
