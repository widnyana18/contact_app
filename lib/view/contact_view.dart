import 'package:azlistview/azlistview.dart';
import 'package:contact_app/components/contact_user_tile.dart';
import 'package:contact_app/components/data_filter_widget.dart';
import 'package:contact_app/controllers/contact_notifier.dart';
import 'package:contact_app/utils/data_view.dart';
import 'package:contact_app/utils/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactView extends StatefulWidget {
  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {

  @override
  Widget build(BuildContext context) {
    List<ContactInfo> contactList = context.select((ContactNotifier bloc) => bloc.contactList);
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Offstage(
          offstage: true,
          child: Align(
            alignment: Alignment.center,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                label: Text(
                  'Sync contact with cloud',
                  style: txtTheme.bodyLarge
                      ?.copyWith(color: theme.colorScheme.secondary),
                ),
                icon: Icon(
                  Icons.navigate_next,
                  color: theme.colorScheme.secondary,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        DataFilterWidget(contactGroup),
        AzListView(
        data: contactList,
        itemCount: contactList.length,
        itemBuilder: (BuildContext context, int index) {
          ContactInfo model = contactList[index];
          return ContactUserTile(           
            model: model      
          );
        },
        physics: BouncingScrollPhysics(),
        susItemBuilder: (BuildContext context, int index) {
          ContactInfo model = contactList[index];
          if ('♥' == model.getSuspensionTag()) {
            return ();
          }
          return ContactUserTile(context, model.getSuspensionTag());
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
          child:
              Text(hint, style: TextStyle(color: Colors.white, fontSize: 30.0)),
        );
      },
        ),
      ],
    );
  }
}
