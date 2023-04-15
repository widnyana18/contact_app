import 'package:contact_app/home.dart';
import 'package:contact_app/utils/app_theme.dart';
import 'package:contact_app/view/call_log_details_view.dart';
import 'package:contact_app/view/views.dart';
import 'package:flutter/material.dart';

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
      home: CallLogDetailsView(),
      // HomePage(child: TeleponView()),
    );
  }
}
