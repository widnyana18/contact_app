import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';

class CallVIew extends StatefulWidget {
  CallVIew({super.key});

  @override
  State<CallVIew> createState() => _CallVIewState();
}

class _CallVIewState extends State<CallVIew> {
  ValueNotifier<bool> _showDialPad = ValueNotifier(false);

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
                      if (!_showDialPad.value) {
                        return IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                          onPressed: item.onTap,
                          icon: Icon(item.icon),
                        );
                      } else {
                        return Container(color: Colors.blue);
                      }
                    }
                    return InkWell(
                      onTap: item.onTap,
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

  List<CallProps> get navigation => [
        CallProps(
          label: 'Contact',
          icon: Icons.person_outline,
          onTap: () {
            context.pushReplacement('/');
          },
        ),
        CallProps(
          label: 'Add person',
          icon: Icons.add_rounded,
          onTap: () {
            context.pushReplacement('/');
          },
        ),
        CallProps(
          label: 'Note',
          icon: Icons.mode_edit_outline_outlined,
          onTap: () {},
        ),
        CallProps(
          label: 'Silent',
          icon: Icons.mic_off_outlined,
          onTap: () {},
        ),
        CallProps(
          label: 'Press',
          icon: Icons.pause_circle_outline,
          onTap: () {},
        ),
        CallProps(
          label: 'Record',
          icon: Icons.record_voice_over_outlined,
          onTap: () {},
        ),
        CallProps(
          icon: Icons.volume_up_outlined,
          onTap: () {},
        ),
        CallProps(
          icon: Icons.call_end_rounded,
          onTap: () {
            context.pop();
          },
        ),
        CallProps(
          icon: Icons.grid_view_rounded,
          onTap: () {
            _showDialPad.value = true;
          },
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
