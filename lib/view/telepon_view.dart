import 'dart:convert' show json;
import 'package:contact_app/utils/data_view.dart';
import 'package:contact_app/utils/model.dart';
import 'package:contact_app/view/dial_pad_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../components/components.dart';

class TeleponView extends StatelessWidget {
  const TeleponView({super.key});

  List<TeleponInfo> get _loadData {
    final List<TeleponInfo> contactList = [];
    rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        contactList.add(TeleponInfo.fromJson(v));
      });
    });
    return contactList;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: _loadData.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return DataFilterWidget(teleponGroup);
              }
              return CallHistoryTile(_loadData[index]);
            },
          ),
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
