import 'package:contact_app/components/data_filter_widget.dart';
import 'package:contact_app/controllers/contact_notifier.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:contact_app/view/contact_view.dart';
import 'package:contact_app/view/telepon_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    final addFab = FloatingActionButton(
      onPressed: () {},
      tooltip: 'Add Contact',
      child: Icon(Icons.add_rounded),
      backgroundColor: theme.colorScheme.secondary,
    );

    final dialFab = FloatingActionButton(
      onPressed: () {},
      tooltip: 'Dialpad phone',
      child: Icon(Icons.dialpad),
      backgroundColor: theme.colorScheme.primary,
    );

    return Scaffold(
      floatingActionButton: dialFab,
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 1,
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
                    SliverPersistentHeader(
                      delegate: SliverHeaderDelegate(
                        height: 50,
                        child: Align(
                          alignment: Alignment.center,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: TextButton.icon(
                              label: Text(
                                'Sync contact with cloud',
                                style: txtTheme.bodyLarge?.copyWith(
                                    color: theme.colorScheme.secondary),
                              ),
                              icon: Icon(
                                Icons.navigate_before,
                                color: theme.colorScheme.secondary,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: SliverHeaderDelegate(
                        child: DataFilterWidget(),
                      ),
                      pinned: true,
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
