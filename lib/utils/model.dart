import 'dart:convert';
import 'package:azlistview/azlistview.dart';

class ContactInfo extends ISuspensionBean {
  String name;
  String? tagIndex;
  String? phone;

  ContactInfo({
    this.phone,
    required this.name,
    this.tagIndex,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        phone = json['phone']?.toString();

  @override
  String getSuspensionTag() => tagIndex!;

  @override
  String toString() => json.encode(this);
}
