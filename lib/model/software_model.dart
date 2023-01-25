// To parse this JSON data, do
//
//     final softwareModel = softwareModelFromJson(jsonString);

import 'dart:convert';

// List<SoftwareModel> softwareModelFromJson(String str) =>
//     List<SoftwareModel>.from(
//         json.decode(str).map((x) => SoftwareModel.fromJson(x)));

// String softwareModelToJson(List<SoftwareModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String softwareModelToJson(List<SoftwareModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class SoftwareModel {
  SoftwareModel({
    required this.id,
    required this.entitiesId,
    required this.isRecursive,
    required this.name,
    required this.comment,
    required this.locationsId,
    required this.usersIdTech,
    required this.groupsIdTech,
    required this.isUpdate,
    required this.softwaresId,
    required this.manufacturersId,
    required this.isDeleted,
    required this.isTemplate,
    required this.templateName,
    required this.dateMod,
    required this.usersId,
    required this.groupsId,
    required this.ticketTco,
    required this.isHelpdeskVisible,
    required this.softwarecategoriesId,
    required this.isValid,
    required this.dateCreation,
    required this.pictures,
    required this.links,
  });

  int? id;
  int? entitiesId;
  int? isRecursive;
  String? name;
  String? comment;
  int? locationsId;
  int? usersIdTech;
  int? groupsIdTech;
  int? isUpdate;
  int? softwaresId;
  int? manufacturersId;
  int? isDeleted;
  int? isTemplate;
  String? templateName;
  DateTime? dateMod;
  int? usersId;
  int? groupsId;
  String? ticketTco;
  int? isHelpdeskVisible;
  int? softwarecategoriesId;
  int? isValid;
  dynamic dateCreation;
  dynamic pictures;
  List<Link> links;

  factory SoftwareModel.fromJson(Map<String, dynamic> json) => SoftwareModel(
        id: json["id"],
        entitiesId: json["entities_id"],
        isRecursive: json["is_recursive"],
        name: json["name"],
        comment: json["comment"],
        locationsId: json["locations_id"],
        usersIdTech: json["users_id_tech"],
        groupsIdTech: json["groups_id_tech"],
        isUpdate: json["is_update"],
        softwaresId: json["softwares_id"],
        manufacturersId: json["manufacturers_id"],
        isDeleted: json["is_deleted"],
        isTemplate: json["is_template"],
        templateName: json["template_name"],
        dateMod: DateTime.parse(json["date_mod"]),
        usersId: json["users_id"],
        groupsId: json["groups_id"],
        ticketTco: json["ticket_tco"],
        isHelpdeskVisible: json["is_helpdesk_visible"],
        softwarecategoriesId: json["softwarecategories_id"],
        isValid: json["is_valid"],
        dateCreation: json["date_creation"],
        pictures: json["pictures"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entities_id": entitiesId,
        "is_recursive": isRecursive,
        "name": name,
        "comment": comment,
        "locations_id": locationsId,
        "users_id_tech": usersIdTech,
        "groups_id_tech": groupsIdTech,
        "is_update": isUpdate,
        "softwares_id": softwaresId,
        "manufacturers_id": manufacturersId,
        "is_deleted": isDeleted,
        "is_template": isTemplate,
        "template_name": templateName,
        "date_mod": dateMod,
        "users_id": usersId,
        "groups_id": groupsId,
        "ticket_tco": ticketTco,
        "is_helpdesk_visible": isHelpdeskVisible,
        "softwarecategories_id": softwarecategoriesId,
        "is_valid": isValid,
        "date_creation": dateCreation,
        "pictures": pictures,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
      };
}

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

enum Rel {
  ENTITY,
  LOCATION,
  GROUP,
  MANUFACTURER,
  SOFTWARE_CATEGORY,
  RESERVATION_ITEM,
  DOCUMENT_ITEM,
  CONTRACT_ITEM,
  INFOCOM,
  ITEM_TICKET,
  ITEM_PROJECT,
  USER
}

final relValues = EnumValues({
  "Contract_Item": Rel.CONTRACT_ITEM,
  "Document_Item": Rel.DOCUMENT_ITEM,
  "Entity": Rel.ENTITY,
  "Group": Rel.GROUP,
  "Infocom": Rel.INFOCOM,
  "Item_Project": Rel.ITEM_PROJECT,
  "Item_Ticket": Rel.ITEM_TICKET,
  "Location": Rel.LOCATION,
  "Manufacturer": Rel.MANUFACTURER,
  "ReservationItem": Rel.RESERVATION_ITEM,
  "SoftwareCategory": Rel.SOFTWARE_CATEGORY,
  "User": Rel.USER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
