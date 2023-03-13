import 'package:contact_app/utils/model.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class ContactUserTile extends StatelessWidget {
  final ContactInfo? model;
  ContactUserTile({this.model});

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
      title: Text(model!.name),
      onTap: () {},
    );
  }
}
