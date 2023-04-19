import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:random_avatar/random_avatar.dart';

import '../constants/call_log_data.dart';
import '../utils/utils.dart';

class ContactDetailsView extends StatelessWidget {
  final String userId;
  final bool showCallLogWidget;
  ContactDetailsView({
    super.key,
    required this.userId,
    this.showCallLogWidget = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverPersistentHeader(
              delegate: SliverHeaderDelegate(
                tightedChild: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      color: Colors.black,
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Text(
                      'Afif Juniesar Satriya',
                      style: TextStyle(color: Colors.black),
                    ),
                    PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          PopupMenuItem(
                            value: 0,
                            child: Text('singleeee'),
                          ),
                        ];
                      },
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                expandedChild: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              context.pop();
                            },
                            color: Colors.black,
                            icon: Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            color: Colors.black,
                            icon: Icon(Icons.more_vert),
                          ),
                        ],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 55,
                          child: randomAvatar(
                            DateTime.now().toIso8601String(),
                          ),
                        ),
                        title: Text('Afif Juniesar Satriya'),
                        subtitle: Text('Made in Ina'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border),
                            ),
                            IconButton(
                              onPressed: () {
                                context.pushNamed(
                                  'edit_contact',
                                  params: {'userId': '20'},
                                );
                              },
                              icon: Icon(Icons.edit_note_rounded),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                minHeight: 65,
                maxHeight: size.height * .5,
              ),
              pinned: true,
            )
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: Text('+62 231-3899-1800'),
                    subtitle: Text('Phone | Indonesia'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {
                            context.pushNamed('call_in');
                          },
                          icon: Icon(Icons.call_rounded),
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.chat_bubble_rounded),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('WhatsApp'),
                    trailing: Image.network(
                        'https://img.icons8.com/color/256/whatsapp.png'),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Meet'),
                    trailing: Image.network(
                        'https://img.icons8.com/color/256/google-meet.png'),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Telegram'),
                    trailing: Image.network(
                        'https://img.icons8.com/external-tal-revivo-color-tal-revivo/256/external-telegram-messenger-privately-held-company-with-cloud-based-instant-messaging-logo-color-tal-revivo.png'),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 20),
                  Text('Call History'),
                  ...List.generate(
                    3,
                    (index) {
                      final data = callLog[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          onTap: () {
                            context.pushNamed('call_in');
                          },
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
                    growable: showCallLogWidget,
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    style:
                        TextButton.styleFrom(backgroundColor: Colors.black26),
                    child: Text('Show more'),
                    onPressed: () {
                      context.pushNamed(
                        'call_logs',
                        params: {'userId': '96'},
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 20),
                  Text('Other'),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Default ringtone'),
                    trailing: Icon(Icons.navigate_next_rounded),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('QR code'),
                    trailing: Icon(Icons.navigate_next_rounded),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
