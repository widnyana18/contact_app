import 'package:azlistview/azlistview.dart';
import 'package:contact_app/components/contact_user_tile.dart';
import 'package:contact_app/controllers/contact_notifier.dart';
import 'package:contact_app/utils/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});
  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    List<ContactInfo> contactList =
        context.select((ContactNotifier bloc) => bloc.contactList);

    return SafeArea(
      child: AzListView(
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
            child: Text(hint,
                style: TextStyle(color: Colors.white, fontSize: 30.0)),
          );
        },
      ),
    );
  }
}
