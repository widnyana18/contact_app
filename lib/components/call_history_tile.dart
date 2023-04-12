import 'package:contact_app/utils/model.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class CallHistoryTile extends StatelessWidget {
  final ContactInfo data;
  CallHistoryTile(this.data);

  @override
  Widget build(BuildContext context) {
    final status = data.isActive ? 'Connected' : 'Disconnected';

    return ListTile(
      leading: CircleAvatar(
        child: randomAvatar(
          DateTime.now().toIso8601String(),
          height: 36,
          width: 36,
        ),
      ),
      title: Text(data.name),
      subtitle: Text('${data.phones} ${data.date} $status'),
      trailing: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.grey,
        child: Icon(Icons.keyboard_arrow_right_rounded),
      ),
      onTap: () {},
    );
  }
}
