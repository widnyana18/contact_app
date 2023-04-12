import 'package:contact_app/utils/utils.dart';
import 'package:contact_app/view/contact_view.dart';
import 'package:contact_app/view/telepon_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/controllers.dart';

class HomePage extends StatelessWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              TabBar(
                automaticIndicatorColorAdjustment: false,
                tabs: [
                  Text(
                    'Calling',
                    style: txtTheme.bodyLarge,
                  ),
                  Text(
                    'Contact',
                    style: txtTheme.bodyLarge,
                  ),
                ],
                onTap: (index) {},
              ),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder: (_, __) => [
                    SliverPersistentHeader(
                      delegate: SliverHeaderDelegate(
                        child: ListTile(
                          dense: true,
                          iconColor: theme.canvasColor,
                          leading: Icon(Icons.search_rounded),
                          title: Text(
                            '46 contact',
                            style: txtTheme.bodyLarge
                                ?.copyWith(color: theme.canvasColor),
                          ),
                          onTap: () {},
                          shape: StadiumBorder(),
                          tileColor: Colors.black12,
                        ),
                      ),
                      floating: true,
                    ),
                  ],
                  body: MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (_) => ContactNotifier(),
                      ),
                      ChangeNotifierProvider(
                        create: (_) => DialPadNotifier(),
                      ),
                    ],
                    child: TabBarView(
                      children: [
                        TeleponView(),
                        ContactView(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
