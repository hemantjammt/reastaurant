// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

BannerListDataModel dataModelFromJson(String str) =>
    BannerListDataModel.fromJson(json.decode(str));

String dataModelToJson(BannerListDataModel data) => json.encode(data.toJson());

class BannerListDataModel {
  BannerListDataModel({
    this.fullName,
    this.designation,
    this.deliveryOnTime,
    this.deliveryOffTime,
    this.banner2,
    this.banner3,
    this.banner4,
    this.banner5,
    this.banner6,
    this.banner7,
    this.banner8,
  });

  String? fullName;
  String? designation;
  dynamic deliveryOnTime;
  dynamic deliveryOffTime;
  String? banner2;
  String? banner3;
  String? banner4;
  String? banner5;
  String? banner6;
  String? banner7;
  String? banner8;

  factory BannerListDataModel.fromJson(Map<String, dynamic> json) =>
      BannerListDataModel(
        fullName: json["FullName"],
        designation: json["Designation"],
        deliveryOnTime: json["DeliveryOnTime"],
        deliveryOffTime: json["DeliveryOFFTime"],
        banner2: json["Banner2"],
        banner3: json["Banner3"],
        banner4: json["Banner4"],
        banner5: json["Banner5"],
        banner6: json["Banner6"],
        banner7: json["Banner7"],
        banner8: json["Banner8"],
      );

  Map<String, dynamic> toJson() => {
        "FullName": fullName,
        "Designation": designation,
        "DeliveryOnTime": deliveryOnTime,
        "DeliveryOFFTime": deliveryOffTime,
        "Banner2": banner2,
        "Banner3": banner3,
        "Banner4": banner4,
        "Banner5": banner5,
        "Banner6": banner6,
        "Banner7": banner7,
        "Banner8": banner8,
      };
}
