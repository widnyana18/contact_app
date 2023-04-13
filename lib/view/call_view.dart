import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class CallVIew extends StatelessWidget {
  CallVIew({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            SizedBox(height: 48),
            CircleAvatar(
              radius: 55,
              child: randomAvatar(
                DateTime.now().toIso8601String(),
              ),
            ),
            SizedBox(height: 20),
            Text('Batman in Heaven'),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/sim_2.jpg',
                  width: 16,
                ),
                SizedBox(width: 8),
                Text('+62 823-7383-4652 | Indonesia'),
              ],
            ),
            SizedBox(height: 8),
            Text('CALLING'),
            Spacer(),
            Expanded(
              flex: 2,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: navigation.map(
                  (item) {
                    if (item.icon == Icons.call_end_rounded) {
                      return IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        onPressed: () {},
                        icon: Icon(item.icon),
                      );
                    }
                    return InkWell(
                      onTap: () {},
                      child: Column(
                        children: [
                          Icon(
                            item.icon,
                            size: 60,
                            color: Colors.black,
                          ),
                          SizedBox(height: 8),
                          Text(item.label ?? ''),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final navigation = [
    CallProps(
      label: 'Contact',
      icon: Icons.person_outline,
    ),
    CallProps(
      label: 'Add person',
      icon: Icons.add_rounded,
    ),
    CallProps(
      label: 'Note',
      icon: Icons.mode_edit_outline_outlined,
    ),
    CallProps(
      label: 'Silent',
      icon: Icons.mic_off_outlined,
    ),
    CallProps(
      label: 'Press',
      icon: Icons.pause_circle_outline,
    ),
    CallProps(
      label: 'Record',
      icon: Icons.record_voice_over_outlined,
    ),
    CallProps(
      icon: Icons.volume_up_outlined,
    ),
    CallProps(
      icon: Icons.call_end_rounded,
    ),
    CallProps(
      icon: Icons.grid_view_rounded,
    ),
  ];
}

@immutable
class CallProps {
  final String? label;
  final IconData icon;
  final VoidCallback? onTap;

  CallProps({
    this.label,
    required this.icon,
    this.onTap,
  });
}
