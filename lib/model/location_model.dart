// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// List<LocationModel> locationModelFromJson(String str) =>
//     List<LocationModel>.from(
//         json.decode(str).map((x) => LocationModel.fromJson(x)));

// String locationModelToJson(List<LocationModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

SchedulesModel schedulesModelFromJson(String str) =>
    SchedulesModel.fromJson(json.decode(str));

String schedulesModelToJson(SchedulesModel data) => json.encode(data.toJson());

class SchedulesModel {
  SchedulesModel({
    required this.data,
  });

  List<LocationModel> data;

  factory SchedulesModel.fromJson(Map<String, dynamic> json) => SchedulesModel(
        data: List<LocationModel>.from(
            json["data"].map((x) => LocationModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class LocationModel {
  LocationModel({
    required this.id,
    required this.entitiesId,
    required this.isRecursive,
    required this.name,
    required this.locationsId,
    required this.completename,
    required this.comment,
    required this.level,
    // required this.ancestorsCache,
    // required this.sonsCache,
    // required this.address,
    // required this.postcode,
    // required this.town,
    // required this.state,
    // required this.country,
    required this.building,
    required this.room,
    // required this.latitude,
    // required this.longitude,
    // required this.altitude,
    // required this.dateMod,
    // required this.dateCreation,
    required this.links,
  });

  int id;
  int entitiesId;
  int isRecursive;
  String name;
  int locationsId;
  String completename;
  String comment;
  int level;
  // String ancestorsCache;
  // String sonsCache;
  // dynamic address;
  // dynamic postcode;
  // dynamic town;
  // dynamic state;
  // dynamic country;
  Building building;
  String room;
  // dynamic latitude;
  // dynamic longitude;
  // dynamic altitude;
  // DateTime dateMod;
  // dynamic dateCreation;
  List<Link> links;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json["id"],
        entitiesId: json["entities_id"],
        isRecursive: json["is_recursive"],
        name: json["name"],
        locationsId: json["locations_id"],
        completename: json["completename"],
        comment: json["comment"],
        level: json["level"],
        // ancestorsCache: json["ancestors_cache"],
        // sonsCache: json["sons_cache"],
        // address: json["address"],
        // postcode: json["postcode"],
        // town: json["town"],
        // state: json["state"],
        // country: json["country"],
        building: buildingValues.map[json["building"]]!,
        room: json["room"],
        // latitude: json["latitude"],
        // longitude: json["longitude"],
        // altitude: json["altitude"],
        // dateMod: DateTime.parse(json["date_mod"]),
        // dateCreation: json["date_creation"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entities_id": entitiesId,
        "is_recursive": isRecursive,
        "name": name,
        "locations_id": locationsId,
        "completename": completename,
        "comment": comment,
        "level": level,
        // "ancestors_cache": ancestorsCache,
        // "sons_cache": sonsCache,
        // "address": address,
        // "postcode": postcode,
        // "town": town,
        // "state": state,
        // "country": country,
        "building": buildingValues.reverse[building],
        "room": room,
        // "latitude": latitude,
        // "longitude": longitude,
        // "altitude": altitude,
        // "date_mod": dateMod.toIso8601String(),
        // "date_creation": dateCreation,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
      };
}

enum Building { MAIN, EMPTY, WORKSHOP }

final buildingValues = EnumValues(
    {"": Building.EMPTY, "Main": Building.MAIN, "Workshop": Building.WORKSHOP});

class Link {
  Link({
    required this.rel,
    required this.href,
  });

  Rel rel;
  String href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: relValues.map[json["rel"]]!,
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "rel": relValues.reverse[rel],
        "href": href,
      };
}

enum Rel { ENTITY, LOCATION }

final relValues = EnumValues({"Entity": Rel.ENTITY, "Location": Rel.LOCATION});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
