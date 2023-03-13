import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:contact_app/utils/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class ContactNotifier extends ChangeNotifier {
  List<ContactInfo> _contactList = [];
  List<ContactInfo> _topList = [];

  ContactNotifier() {
    _topList.add(ContactInfo(name: '新的朋友', tagIndex: '↑'));
    _topList.add(ContactInfo(name: '群聊', tagIndex: '↑'));
    _topList.add(ContactInfo(name: '标签', tagIndex: '↑'));
    _topList.add(ContactInfo(name: '公众号', tagIndex: '↑'));

    _loadData();
  }

  List<ContactInfo> get contactList => _contactList;

  void _loadData() async {
    rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        _contactList.add(ContactInfo.fromJson(v));
      });
      _handleList(_contactList);
    });

    notifyListeners();
  }

  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String tag = '';
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(_contactList);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(_contactList);

    // add _topList.
    _contactList.insertAll(0, _topList);
  }
}
