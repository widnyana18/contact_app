import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:contact_app/utils/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactNotifier extends ChangeNotifier {
  List<ContactInfo> _contactList = [];
  List<ContactInfo> _topList = [];

  ContactNotifier._sharedInstance() {
    _topList.add(ContactInfo(name: 'I Guora Manrow', tagIndex: '♥'));
    _topList.add(ContactInfo(name: 'My Group', tagIndex: '♥'));
    _topList.add(ContactInfo(name: 'Akademik Stikom', tagIndex: '♥'));

    Future.delayed(Duration(milliseconds: 500), () {
      _loadData();
    });
  }

  static final _shared = ContactNotifier._sharedInstance();

  factory ContactNotifier() => _shared;

  List<ContactInfo> get contactList => _contactList;

  void _loadData() async {
    await rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        _contactList.add(ContactInfo.fromJson(v));
      });
      _handleList(_contactList);
      notifyListeners();
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String name = list[i].name;
      String tag = name.substring(0, 1).toUpperCase();

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
