// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.id,
    required this.entitiesId,
    required this.name,
    required this.dateMod,
    required this.contact,
    required this.contactNum,
    required this.usersIdTech,
    required this.groupsIdTech,
    required this.comment,
    required this.serial,
    required this.otherserial,
    required this.size,
    required this.haveMicro,
    required this.haveSpeaker,
    required this.haveSubd,
    required this.haveBnc,
    required this.haveDvi,
    required this.havePivot,
    required this.haveHdmi,
    required this.haveDisplayport,
    required this.locationsId,
    required this.monitortypesId,
    required this.monitormodelsId,
    required this.manufacturersId,
    required this.isGlobal,
    required this.isDeleted,
    required this.isTemplate,
    this.templateName,
    required this.usersId,
    required this.groupsId,
    required this.statesId,
    required this.ticketTco,
    required this.isDynamic,
    this.uuid,
    required this.autoupdatesystemsId,
    this.dateCreation,
    required this.isRecursive,
    required this.links,
  });

  int id;
  int entitiesId;
  String name;
  DateTime dateMod;
  String contact;
  String contactNum;
  int usersIdTech;
  int groupsIdTech;
  String comment;
  String serial;
  String otherserial;
  String size;
  int haveMicro;
  int haveSpeaker;
  int haveSubd;
  int haveBnc;
  int haveDvi;
  int havePivot;
  int haveHdmi;
  int haveDisplayport;
  int locationsId;
  int monitortypesId;
  int monitormodelsId;
  int manufacturersId;
  int isGlobal;
  int isDeleted;
  int isTemplate;
  TemplateName? templateName;
  int usersId;
  int groupsId;
  int statesId;
  String ticketTco;
  int isDynamic;
  dynamic uuid;
  int autoupdatesystemsId;
  dynamic dateCreation;
  int isRecursive;
  List<Link> links;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        entitiesId: json["entities_id"],
        name: json["name"],
        dateMod: DateTime.parse(json["date_mod"]),
        contact: json["contact"],
        contactNum: json["contact_num"],
        usersIdTech: json["users_id_tech"],
        groupsIdTech: json["groups_id_tech"],
        comment: json["comment"],
        serial: json["serial"],
        otherserial: json["otherserial"],
        size: json["size"],
        haveMicro: json["have_micro"],
        haveSpeaker: json["have_speaker"],
        haveSubd: json["have_subd"],
        haveBnc: json["have_bnc"],
        haveDvi: json["have_dvi"],
        havePivot: json["have_pivot"],
        haveHdmi: json["have_hdmi"],
        haveDisplayport: json["have_displayport"],
        locationsId: json["locations_id"],
        monitortypesId: json["monitortypes_id"],
        monitormodelsId: json["monitormodels_id"],
        manufacturersId: json["manufacturers_id"],
        isGlobal: json["is_global"],
        isDeleted: json["is_deleted"],
        isTemplate: json["is_template"],
        templateName: templateNameValues.map[json["template_name"]]!,
        usersId: json["users_id"],
        groupsId: json["groups_id"],
        statesId: json["states_id"],
        ticketTco: json["ticket_tco"],
        isDynamic: json["is_dynamic"],
        uuid: json["uuid"],
        autoupdatesystemsId: json["autoupdatesystems_id"],
        dateCreation: json["date_creation"],
        isRecursive: json["is_recursive"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entities_id": entitiesId,
        "name": name,
        "date_mod": dateMod.toIso8601String(),
        "contact": contact,
        "contact_num": contactNum,
        "users_id_tech": usersIdTech,
        "groups_id_tech": groupsIdTech,
        "comment": comment,
        "serial": serial,
        "otherserial": otherserial,
        "size": size,
        "have_micro": haveMicro,
        "have_speaker": haveSpeaker,
        "have_subd": haveSubd,
        "have_bnc": haveBnc,
        "have_dvi": haveDvi,
        "have_pivot": havePivot,
        "have_hdmi": haveHdmi,
        "have_displayport": haveDisplayport,
        "locations_id": locationsId,
        "monitortypes_id": monitortypesId,
        "monitormodels_id": monitormodelsId,
        "manufacturers_id": manufacturersId,
        "is_global": isGlobal,
        "is_deleted": isDeleted,
        "is_template": isTemplate,
        "template_name": templateNameValues.reverse[templateName],
        "users_id": usersId,
        "groups_id": groupsId,
        "states_id": statesId,
        "ticket_tco": ticketTco,
        "is_dynamic": isDynamic,
        "uuid": uuid,
        "autoupdatesystems_id": autoupdatesystemsId,
        "date_creation": dateCreation,
        "is_recursive": isRecursive,
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
  GROUP,
  LOCATION,
  MONITOR_TYPE,
  MONITOR_MODEL,
  MANUFACTURER,
  STATE,
  RESERVATION_ITEM,
  DOCUMENT_ITEM,
  CONTRACT_ITEM,
  INFOCOM,
  ITEM_TICKET,
  ITEM_PROJECT,
  NETWORK_PORT,
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
  "MonitorModel": Rel.MONITOR_MODEL,
  "MonitorType": Rel.MONITOR_TYPE,
  "NetworkPort": Rel.NETWORK_PORT,
  "ReservationItem": Rel.RESERVATION_ITEM,
  "State": Rel.STATE,
  "User": Rel.USER
});

enum TemplateName { MONITOR_HP_P221, MONITOR_HP_LV1911, HP_PAVILION_20_FI }

final templateNameValues = EnumValues({
  "HP Pavilion 20fi": TemplateName.HP_PAVILION_20_FI,
  "Monitor HP LV1911": TemplateName.MONITOR_HP_LV1911,
  "Monitor HP P221": TemplateName.MONITOR_HP_P221
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
