import 'package:meta/meta.dart';
import 'dart:convert';

List<NetworkModel> networkModelFromJson(String str) => List<NetworkModel>.from(
    json.decode(str).map((x) => NetworkModel.fromJson(x)));

String networkModelToJson(List<NetworkModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NetworkModel {
  NetworkModel({
    required this.id,
    required this.name,
    required this.comment,
    // required this.dateMod,
    // required this.dateCreation,
  });

  int? id;
  String? name;
  String? comment;
  // DateTime? dateMod;
  // DateTime? dateCreation;

  factory NetworkModel.fromJson(Map<String, dynamic> json) => NetworkModel(
        id: json["id"],
        name: json["name"],
        comment: json["comment"],
        // dateMod: DateTime.parse(json["date_mod"]),
        // dateCreation: DateTime.parse(json["date_creation"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "comment": comment,
        // "date_mod": dateMod,
        // "date_creation": dateCreation,
      };
}
