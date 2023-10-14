// To parse this JSON data, do
//
//     final quickActionModel = quickActionModelFromJson(jsonString);

import 'dart:convert';

List<QuickActionModel> quickActionModelFromJson(String str) =>
    List<QuickActionModel>.from(
        json.decode(str).map((x) => QuickActionModel.fromJson(x)));

String quickActionModelToJson(List<QuickActionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuickActionModel {
  String? title;
  String? icon;
  String? color;

  QuickActionModel({
    this.title,
    this.icon,
    this.color,
  });

  factory QuickActionModel.fromJson(Map<String, dynamic> json) =>
      QuickActionModel(
        title: json["title"],
        icon: json["icon"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "color": color,
      };
}
