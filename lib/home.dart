import 'package:contact_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/controllers.dart';
import 'view/views.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      final index = _tabController.index;
      if (index == 1) {
        Navigator.maybePop(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          Navigator.maybePop(context);
        },
        onHorizontalDragEnd: (details) {
          Navigator.maybePop(context);
        },
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
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
                  body: TabBarView(
                    controller: _tabController,
                    children: [
                      TeleponView(),
                      ContactView(),
                    ],
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
