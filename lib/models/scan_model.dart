import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;  

// import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';

// import 'package:flutter/material.dart';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));
String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
  int? id;
  String? type;
  String valor;

  ScanModel({
    this.id,
    this.type,
    required this.valor,
  }) {
    if (valor.contains('http')) {
      type = 'http';
    } else {
      type = 'geo';
    }
  }

  LatLng getLatLng(){

    final latLng = valor.substring(4).split(',');
    final lat = double.parse(latLng[0]);
    final lng = double.parse(latLng[1]);

    return LatLng(lng, lat);
  }

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "valor": valor,
      };
}
