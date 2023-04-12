import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:contact_app/utils/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactNotifier extends ChangeNotifier {
  List<ContactInfo> _dataRaw = [];
  List<ContactInfo> _dataModified = [];

  ContactNotifier._sharedInstance() {
    final topList = [
      ContactInfo(name: 'I Guora Manrow', tagIndex: '♥'),
      ContactInfo(name: 'My Group', tagIndex: '♥'),
      ContactInfo(name: 'Akademik Stikom', tagIndex: '♥'),
    ];
    _dataModified.addAll(topList);

    Future.delayed(Duration(milliseconds: 500), () {
      _loadData();
    });
  }

  static final _shared = ContactNotifier._sharedInstance();

  factory ContactNotifier() => _shared;

  List<ContactInfo> get contactList => _dataModified;

  List<ContactInfo> get teleponList => _dataRaw;

  void _loadData() async {
    await rootBundle.loadString('assets/data/contacts.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        _dataRaw.add(ContactInfo.fromJson(v));
      });
      _handleList(_dataRaw);
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
    SuspensionUtil.sortListBySuspensionTag(_dataRaw);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(_dataRaw);

    // add _dataModified.
    _dataModified.addAll(_dataRaw);
  }
}
