import 'package:azlistview/azlistview.dart';
import 'package:contact_app/controllers/contact_notifier.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../constants/data_view.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});
  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Stack(
      children: [
        SafeArea(
          child: Column(
            children: [
              Offstage(
                offstage: false,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text('66 contacts', style: txtTheme.bodySmall),
                        SizedBox(height: 12),
                        Text(
                          '1 contact or photo has not been synced',
                          style: txtTheme.bodySmall
                              ?.copyWith(color: theme.colorScheme.error),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DataFilterWidget(contactGroup),
              Expanded(
                child: Consumer<ContactNotifier>(
                  builder: (context, value, child) {
                    final contactList = value.contactList;
                    return AzListView(
                      data: contactList,
                      itemCount: contactList.length,
                      itemBuilder: (BuildContext context, int index) {
                        ContactInfo model = contactList[index];
                        return ContactUserTile(name: model.name);
                      },
                      physics: BouncingScrollPhysics(),
                      susItemBuilder: (BuildContext context, int index) {
                        ContactInfo model = contactList[index];
                        if ('♥' == model.getSuspensionTag()) {
                          return ContactSusTile(tag: 'Favorite');
                        }
                        return ContactSusTile(tag: model.getSuspensionTag());
                      },
                      indexBarData: ['♥', ...kIndexBarData],
                      indexHintBuilder: (context, hint) {
                        return Container(
                          alignment: Alignment.center,
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.blue[700]!.withAlpha(200),
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            hint,
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              context.pushNamed('add_contact');
            },
            tooltip: 'Add Contact',
            child: Icon(Icons.add_rounded),
            backgroundColor: theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
