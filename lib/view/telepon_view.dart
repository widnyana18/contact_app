import 'package:contact_app/controllers/contact_notifier.dart';
import 'package:contact_app/utils/data_view.dart';
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
  // Future<List<TeleponInfo>> _loadData() async {
  //   final value = await rootBundle.loadString('assets/data/contacts.json');
  //   final list = json.decode(value);
  //   List<TeleponInfo> data = list.map((v) {
  //     return TeleponInfo.fromJson(v);
  //   }).toList();
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
