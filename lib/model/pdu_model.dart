import 'dart:convert';

List<PduModel> PduFromJson(String str) =>
    List<PduModel>.from(json.decode(str).map((x) => PduModel.fromJson(x)));

String PduToJson(List<PduModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PduModel {
  PduModel({
    required this.id,
    required this.name,
    required this.entitiesId,
    required this.isRecursive,
    required this.locationsId,
    required this.serial,
    required this.otherserial,
    required this.pdumodelsId,
    required this.usersIdTech,
    required this.groupsIdTech,
    required this.isTemplate,
    this.templateName,
    required this.isDeleted,
    required this.statesId,
    required this.comment,
    required this.manufacturersId,
    required this.pdutypesId,
    required this.dateMod,
    required this.dateCreation,
    required this.links,
  });

  int id;
  String name;
  int entitiesId;
  int isRecursive;
  int locationsId;
  String serial;
  String otherserial;
  int pdumodelsId;
  int usersIdTech;
  int groupsIdTech;
  int isTemplate;
  dynamic templateName;
  int isDeleted;
  int statesId;
  String comment;
  int manufacturersId;
  int pdutypesId;
  DateTime dateMod;
  DateTime dateCreation;
  List<Link> links;

  factory PduModel.fromJson(Map<String, dynamic> json) => PduModel(
        id: json["id"],
        name: json["name"],
        entitiesId: json["entities_id"],
        isRecursive: json["is_recursive"],
        locationsId: json["locations_id"],
        serial: json["serial"],
        otherserial: json["otherserial"],
        pdumodelsId: json["pdumodels_id"],
        usersIdTech: json["users_id_tech"],
        groupsIdTech: json["groups_id_tech"],
        isTemplate: json["is_template"],
        templateName: json["template_name"],
        isDeleted: json["is_deleted"],
        statesId: json["states_id"],
        comment: json["comment"],
        manufacturersId: json["manufacturers_id"],
        pdutypesId: json["pdutypes_id"],
        dateMod: DateTime.parse(json["date_mod"]),
        dateCreation: DateTime.parse(json["date_creation"]),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "entities_id": entitiesId,
        "is_recursive": isRecursive,
        "locations_id": locationsId,
        "serial": serial,
        "otherserial": otherserial,
        "pdumodels_id": pdumodelsId,
        "users_id_tech": usersIdTech,
        "groups_id_tech": groupsIdTech,
        "is_template": isTemplate,
        "template_name": templateName,
        "is_deleted": isDeleted,
        "states_id": statesId,
        "comment": comment,
        "manufacturers_id": manufacturersId,
        "pdutypes_id": pdutypesId,
        "date_mod": dateMod.toIso8601String(),
        "date_creation": dateCreation.toIso8601String(),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
      };
}

class Link {
  Link({
    required this.rel,
    required this.href,
  });

  String rel;
  String href;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: json["rel"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "rel": rel,
        "href": href,
      };
}
