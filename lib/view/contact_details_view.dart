import 'package:contact_app/utils/sliver_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class ContactDetailsView extends StatelessWidget {
  final String userId;
  const ContactDetailsView({super.key, required this.userId});

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
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    Text('Afif Juniesar Satriya'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert),
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
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_ios_new_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
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
                              onPressed: () {},
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
                          onPressed: () {},
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
                    trailing: Image.asset('assets/images/wa.png'),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Meet'),
                    trailing: Image.asset('assets/images/meet.png'),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Telegram'),
                    trailing: Image.asset('assets/images/tele.png'),
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
