import 'package:contact_app/controllers/contact_notifier.dart';
import 'package:contact_app/utils/app_theme.dart';
import 'package:contact_app/utils/sliver_header_delegate.dart';
import 'package:contact_app/view/contact_view.dart';
import 'package:contact_app/view/telepon_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Phone',
      theme: AppTheme.light,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
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
      body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (_, __) => [
            SliverPersistentHeader(
              delegate: SliverHeaderDelegate(
                child: TabBar(
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
              ),
              pinned: true,
            ),
            SliverPersistentHeader(
              delegate: SliverHeaderDelegate(
                child: ListTile(
                  leading: Icon(Icons.search_rounded),
                  title: Text(
                    '46 contact',
                    style: txtTheme.bodyLarge
                        ?.copyWith(color: theme.colorScheme.tertiary),
                  ),
                  onTap: () {},
                  shape: StadiumBorder(),
                  tileColor: theme.canvasColor,
                ),
              ),
              floating: true,
            ),
          ],
          body: TabBarView(
            children: [
              TeleponView(),
              ChangeNotifierProvider(
                create: (_) => ContactNotifier(),
                child: ContactView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
