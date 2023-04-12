import 'dart:convert';
import 'package:azlistview/azlistview.dart';

class ContactInfo extends ISuspensionBean {
  final String name;
  final String? date;
  final String? phones;
  final bool isActive;
  String? tagIndex;

  ContactInfo({
    required this.name,
    this.phones,
    this.date,
    this.tagIndex,
    this.isActive = true,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phones = json['phone'].toString(),
        date = json['date'],
        isActive = json['active'] as bool;

  String get phone => phones!.substring(1, phones!.length - 1);

  @override
  String getSuspensionTag() => tagIndex!;

  @override
  String toString() => json.encode(this);
}
