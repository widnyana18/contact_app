import 'dart:convert';
import 'package:azlistview/azlistview.dart';

class ContactInfo extends ISuspensionBean {
  String name;
  String? tagIndex;
  String? id;

  ContactInfo({
    this.id,
    required this.name,
    this.tagIndex,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id']?.toString();

  @override
  String getSuspensionTag() => tagIndex!;

  @override
  String toString() => json.encode(this);
}
