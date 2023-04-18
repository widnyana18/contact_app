import 'package:contact_app/controllers/dial_pad_notifier.dart';
import 'package:contact_app/routes/app_routes.dart';
import 'package:contact_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DialPadNotifier(),
      lazy: false,
      child: MaterialApp.router(
        routerDelegate: appRouter.routerDelegate,
        routeInformationParser: appRouter.routeInformationParser,
        debugShowCheckedModeBanner: false,
        title: 'Contact Phone',
        theme: AppTheme.light,
      ),
    );
  }
}
