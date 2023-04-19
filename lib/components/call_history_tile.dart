import 'package:contact_app/utils/model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      subtitle: Text('${data.phone} ${data.date} $status'),
      trailing: IconButton(
        onPressed: () {
          context.push(
            '/telepon/20',
          );
        },
        color: Colors.grey,
        iconSize: 22,
        icon: Icon(Icons.keyboard_arrow_right_rounded),
      ),
      onTap: () {
        context.push('/call-in');
      },
    );
  }
}
