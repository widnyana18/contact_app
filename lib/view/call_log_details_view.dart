import 'package:contact_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CallLogDetailsView extends StatelessWidget {
  CallLogDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call History Details'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: callLog.length,
        itemBuilder: (context, index) {
          final data = callLog[index];

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              title: Text(data.date),
              subtitle: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(data.phone),
                  SizedBox(width: 4),
                  Icon(Icons.north_east_rounded),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(data.status),
                  SizedBox(width: 4),
                  Image.asset('assets/images/sim_2_outlined.png'),
                ],
              ),
            ),
          );
        },
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: actBtn
                .map(
                  (item) => Expanded(
                    child: Material(
                      child: InkWell(
                        onTap: item.onTap,
                        child: Column(
                          children: [
                            Icon(
                              item.icon,
                              color: Colors.black,
                            ),
                            SizedBox(height: 4),
                            Text(item.label)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }

  final actBtn = [
    CallLogActButton(
      onTap: () {},
      label: 'Recorded call',
      icon: Icons.record_voice_over_outlined,
    ),
    CallLogActButton(
      onTap: () {},
      label: 'Call note',
      icon: Icons.text_snippet_outlined,
    ),
    CallLogActButton(
      onTap: () {},
      label: 'Clear call log',
      icon: Icons.delete_outline_rounded,
    ),
  ];
}

class CallLogActButton {
  final VoidCallback onTap;
  final String label;
  final IconData icon;

  CallLogActButton({
    required this.onTap,
    required this.label,
    required this.icon,
  });
}
