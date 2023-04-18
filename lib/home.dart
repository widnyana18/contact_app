import 'package:contact_app/utils/utils.dart';
import 'package:contact_app/view/contact_view.dart';
import 'package:contact_app/view/telepon_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/controllers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
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
              ),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder: (_, __) => [
                    SliverPersistentHeader(
                      delegate: SliverHeaderDelegate(
                        tightedChild: ListTile(
                          dense: true,
                          iconColor: theme.canvasColor,
                          leading: Icon(Icons.search_rounded),
                          title: Text(
                            '46 contact',
                            style: txtTheme.bodyLarge
                                ?.copyWith(color: theme.canvasColor),
                          ),
                          onTap: () {
                            showSearch(
                              context: context,
                              delegate: ContactSearchDelegate([
                                'apple',
                                'banana',
                                'cherry',
                                'date',
                                'elderberry'
                              ]),
                            );
                          },
                          shape: StadiumBorder(),
                          tileColor: Colors.black12,
                        ),
                      ),
                      floating: true,
                    ),
                  ],
                  body: ChangeNotifierProvider(
                    create: (_) => ContactNotifier(),
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
