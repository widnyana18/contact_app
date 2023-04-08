import 'package:contact_app/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/views.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = GoRouter(
  navigatorKey: _rootNavigator,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigator,
      builder: (context, state, child) =>
          HomePage(key: state.pageKey, child: child),
      routes: [
        GoRoute(
          path: '/telepon',
          name: 'telepon',
          builder: (context, state) {
            return TeleponView(
              key: state.pageKey,
            );
          },
        ),
        GoRoute(
          path: '/contact',
          name: 'contact',
          builder: (context, state) {
            return ContactView(
              key: state.pageKey,
            );
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigator,
              path: '/:id',
              name: 'contact-details',
              builder: (context, state) {
                final id = state.params['id'].toString();
                return ContactDetailsView(
                  key: state.pageKey,
                  userId: id,
                );
              },
            )
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/setting',
      name: 'setting',
      builder: (context, state) {
        return SettingView(
          key: state.pageKey,
        );
      },
    )
  ],
  errorBuilder: (context, state) => ErrorView(
    key: state.pageKey,
  ),
);
