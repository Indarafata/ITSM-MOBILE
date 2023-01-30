import 'dart:convert';

List<RackModel> RackFromJson(String str) =>
    List<RackModel>.from(json.decode(str).map((x) => RackModel.fromJson(x)));

String RackToJson(List<RackModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RackModel {
  RackModel({
    required this.id,
    required this.name,
    required this.comment,
    required this.entitiesId,
    required this.isRecursive,
    required this.locationsId,
    required this.serial,
    required this.otherserial,
    required this.rackmodelsId,
    required this.manufacturersId,
    required this.racktypesId,
    required this.statesId,
    required this.usersIdTech,
    required this.groupsIdTech,
    required this.width,
    required this.height,
    required this.depth,
    required this.numberUnits,
    required this.isTemplate,
    this.templateName,
    required this.isDeleted,
    required this.dcroomsId,
    required this.roomOrientation,
    this.position,
    required this.bgcolor,
    required this.maxPower,
    required this.mesuredPower,
    required this.maxWeight,
    required this.dateMod,
    required this.dateCreation,
    required this.links,
  });

  int id;
  String name;
  String comment;
  int entitiesId;
  int isRecursive;
  int locationsId;
  String serial;
  String otherserial;
  int rackmodelsId;
  int manufacturersId;
  int racktypesId;
  int statesId;
  int usersIdTech;
  int groupsIdTech;
  int width;
  int height;
  int depth;
  int numberUnits;
  int isTemplate;
  String? templateName;
  int isDeleted;
  int dcroomsId;
  int roomOrientation;
  dynamic position;
  Bgcolor bgcolor;
  int maxPower;
  int mesuredPower;
  int maxWeight;
  DateTime dateMod;
  DateTime dateCreation;
  List<Link> links;

  factory RackModel.fromJson(Map<String, dynamic> json) => RackModel(
        id: json["id"],
        name: json["name"],
        comment: json["comment"],
        entitiesId: json["entities_id"],
        isRecursive: json["is_recursive"],
        locationsId: json["locations_id"],
        serial: json["serial"],
        otherserial: json["otherserial"],
        rackmodelsId: json["rackmodels_id"],
        manufacturersId: json["manufacturers_id"],
        racktypesId: json["racktypes_id"],
        statesId: json["states_id"],
        usersIdTech: json["users_id_tech"],
        groupsIdTech: json["groups_id_tech"],
        width: json["width"],
        height: json["height"],
        depth: json["depth"],
        numberUnits: json["number_units"],
        isTemplate: json["is_template"],
        templateName: json["template_name"],
        isDeleted: json["is_deleted"],
        dcroomsId: json["dcrooms_id"],
        roomOrientation: json["room_orientation"],
        position: json["position"],
        bgcolor: bgcolorValues.map[json["bgcolor"]]!,
        maxPower: json["max_power"],
        mesuredPower: json["mesured_power"],
        maxWeight: json["max_weight"],
        dateMod: DateTime.parse(json["date_mod"]),
        dateCreation: DateTime.parse(json["date_creation"]),
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "comment": comment,
        "entities_id": entitiesId,
        "is_recursive": isRecursive,
        "locations_id": locationsId,
        "serial": serial,
        "otherserial": otherserial,
        "rackmodels_id": rackmodelsId,
        "manufacturers_id": manufacturersId,
        "racktypes_id": racktypesId,
        "states_id": statesId,
        "users_id_tech": usersIdTech,
        "groups_id_tech": groupsIdTech,
        "width": width,
        "height": height,
        "depth": depth,
        "number_units": numberUnits,
        "is_template": isTemplate,
        "template_name": templateName,
        "is_deleted": isDeleted,
        "dcrooms_id": dcroomsId,
        "room_orientation": roomOrientation,
        "position": position,
        "bgcolor": bgcolorValues.reverse[bgcolor],
        "max_power": maxPower,
        "mesured_power": mesuredPower,
        "max_weight": maxWeight,
        "date_mod": dateMod.toIso8601String(),
        "date_creation": dateCreation.toIso8601String(),
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
      };
}

enum Bgcolor { FEC95_C, THE_8_FCE00 }

final bgcolorValues =
    EnumValues({"#fec95c": Bgcolor.FEC95_C, "#8fce00": Bgcolor.THE_8_FCE00});

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
  RACK_MODEL,
  MANUFACTURER,
  STATE,
  GROUP,
  CONTRACT_ITEM,
  INFOCOM,
  ITEM_TICKET
}

final relValues = EnumValues({
  "Contract_Item": Rel.CONTRACT_ITEM,
  "Entity": Rel.ENTITY,
  "Group": Rel.GROUP,
  "Infocom": Rel.INFOCOM,
  "Item_Ticket": Rel.ITEM_TICKET,
  "Location": Rel.LOCATION,
  "Manufacturer": Rel.MANUFACTURER,
  "RackModel": Rel.RACK_MODEL,
  "State": Rel.STATE
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
