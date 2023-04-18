import 'package:contact_app/controllers/contact_notifier.dart';
import 'package:contact_app/constants/data_view.dart';
import 'package:contact_app/controllers/dial_pad_notifier.dart';
import 'package:contact_app/view/dial_pad_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/components.dart';

class TeleponView extends StatefulWidget {
  TeleponView({super.key});

  @override
  State<TeleponView> createState() => _TeleponViewState();
}

class _TeleponViewState extends State<TeleponView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;

    return Stack(
      fit: StackFit.expand,
      children: [
        Consumer<ContactNotifier>(
          builder: (context, value, child) {
            final data = value.teleponList;
            print(data.length);
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return DataFilterWidget(teleponGroup);
                }
                return CallHistoryTile(data[index]);
              },
            );
          },
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                constraints: BoxConstraints(maxHeight: height * .7),
                builder: (context) => DialPadView(),
              );
            },
            tooltip: 'Dialpad phone',
            child: Icon(Icons.dialpad),
            backgroundColor: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
