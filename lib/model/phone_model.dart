// To parse this JSON data, do
//
//     final phoneModel = phoneModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<PhoneModel> phoneModelFromJson(String str) =>
    List<PhoneModel>.from(json.decode(str).map((x) => PhoneModel.fromJson(x)));

String phoneModelToJson(List<PhoneModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhoneModel {
  PhoneModel({
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
    required this.locationsId,
    required this.phonetypesId,
    required this.phonemodelsId,
    required this.brand,
    required this.phonepowersuppliesId,
    required this.numberLine,
    required this.haveHeadset,
    required this.haveHp,
    required this.manufacturersId,
    required this.isGlobal,
    required this.isDeleted,
    required this.isTemplate,
    required this.templateName,
    required this.usersId,
    required this.groupsId,
    required this.statesId,
    required this.ticketTco,
    required this.isDynamic,
    required this.uuid,
    required this.autoupdatesystemsId,
    required this.dateCreation,
    required this.isRecursive,
    required this.lastInventoryUpdate,
    required this.links,
  });

  int? id;
  int? entitiesId;
  String? name;
  DateTime dateMod;
  String? contact;
  String? contactNum;
  int? usersIdTech;
  int? groupsIdTech;
  String? comment;
  String? serial;
  String? otherserial;
  int? locationsId;
  int? phonetypesId;
  int? phonemodelsId;
  String? brand;
  int? phonepowersuppliesId;
  String? numberLine;
  int? haveHeadset;
  int? haveHp;
  int? manufacturersId;
  int? isGlobal;
  int? isDeleted;
  int? isTemplate;
  String? templateName;
  int? usersId;
  int? groupsId;
  int? statesId;
  String? ticketTco;
  int? isDynamic;
  dynamic uuid;
  int? autoupdatesystemsId;
  dynamic dateCreation;
  int? isRecursive;
  dynamic lastInventoryUpdate;
  List<Link> links;

  factory PhoneModel.fromJson(Map<String, dynamic> json) => PhoneModel(
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
        locationsId: json["locations_id"],
        phonetypesId: json["phonetypes_id"],
        phonemodelsId: json["phonemodels_id"],
        brand: json["brand"],
        phonepowersuppliesId: json["phonepowersupplies_id"],
        numberLine: json["number_line"],
        haveHeadset: json["have_headset"],
        haveHp: json["have_hp"],
        manufacturersId: json["manufacturers_id"],
        isGlobal: json["is_global"],
        isDeleted: json["is_deleted"],
        isTemplate: json["is_template"],
        templateName: json["template_name"],
        usersId: json["users_id"],
        groupsId: json["groups_id"],
        statesId: json["states_id"],
        ticketTco: json["ticket_tco"],
        isDynamic: json["is_dynamic"],
        uuid: json["uuid"],
        autoupdatesystemsId: json["autoupdatesystems_id"],
        dateCreation: json["date_creation"],
        isRecursive: json["is_recursive"],
        lastInventoryUpdate: json["last_inventory_update"],
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
        "locations_id": locationsId,
        "phonetypes_id": phonetypesId,
        "phonemodels_id": phonemodelsId,
        "brand": brand,
        "phonepowersupplies_id": phonepowersuppliesId,
        "number_line": numberLine,
        "have_headset": haveHeadset,
        "have_hp": haveHp,
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
        "last_inventory_update": lastInventoryUpdate,
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
  PHONE_TYPE,
  PHONE_MODEL,
  MANUFACTURER,
  STATE,
  RESERVATION_ITEM,
  DOCUMENT_ITEM,
  CONTRACT_ITEM,
  INFOCOM,
  ITEM_TICKET,
  ITEM_PROJECT,
  NETWORK_PORT,
  ITEM_DEVICE_MOTHERBOARD,
  ITEM_DEVICE_FIRMWARE,
  ITEM_DEVICE_PROCESSOR,
  ITEM_DEVICE_MEMORY,
  ITEM_DEVICE_HARD_DRIVE,
  ITEM_DEVICE_NETWORK_CARD,
  ITEM_DEVICE_DRIVE,
  ITEM_DEVICE_BATTERY,
  ITEM_DEVICE_GRAPHIC_CARD,
  ITEM_DEVICE_SOUND_CARD,
  ITEM_DEVICE_CONTROL,
  ITEM_DEVICE_PCI,
  ITEM_DEVICE_CASE,
  ITEM_DEVICE_POWER_SUPPLY,
  ITEM_DEVICE_GENERIC,
  ITEM_DEVICE_SIMCARD,
  ITEM_DEVICE_SENSOR,
  ITEM_DEVICE_CAMERA,
  USER
}

final relValues = EnumValues({
  "Contract_Item": Rel.CONTRACT_ITEM,
  "Document_Item": Rel.DOCUMENT_ITEM,
  "Entity": Rel.ENTITY,
  "Group": Rel.GROUP,
  "Infocom": Rel.INFOCOM,
  "Item_DeviceBattery": Rel.ITEM_DEVICE_BATTERY,
  "Item_DeviceCamera": Rel.ITEM_DEVICE_CAMERA,
  "Item_DeviceCase": Rel.ITEM_DEVICE_CASE,
  "Item_DeviceControl": Rel.ITEM_DEVICE_CONTROL,
  "Item_DeviceDrive": Rel.ITEM_DEVICE_DRIVE,
  "Item_DeviceFirmware": Rel.ITEM_DEVICE_FIRMWARE,
  "Item_DeviceGeneric": Rel.ITEM_DEVICE_GENERIC,
  "Item_DeviceGraphicCard": Rel.ITEM_DEVICE_GRAPHIC_CARD,
  "Item_DeviceHardDrive": Rel.ITEM_DEVICE_HARD_DRIVE,
  "Item_DeviceMemory": Rel.ITEM_DEVICE_MEMORY,
  "Item_DeviceMotherboard": Rel.ITEM_DEVICE_MOTHERBOARD,
  "Item_DeviceNetworkCard": Rel.ITEM_DEVICE_NETWORK_CARD,
  "Item_DevicePci": Rel.ITEM_DEVICE_PCI,
  "Item_DevicePowerSupply": Rel.ITEM_DEVICE_POWER_SUPPLY,
  "Item_DeviceProcessor": Rel.ITEM_DEVICE_PROCESSOR,
  "Item_DeviceSensor": Rel.ITEM_DEVICE_SENSOR,
  "Item_DeviceSimcard": Rel.ITEM_DEVICE_SIMCARD,
  "Item_DeviceSoundCard": Rel.ITEM_DEVICE_SOUND_CARD,
  "Item_Project": Rel.ITEM_PROJECT,
  "Item_Ticket": Rel.ITEM_TICKET,
  "Location": Rel.LOCATION,
  "Manufacturer": Rel.MANUFACTURER,
  "NetworkPort": Rel.NETWORK_PORT,
  "PhoneModel": Rel.PHONE_MODEL,
  "PhoneType": Rel.PHONE_TYPE,
  "ReservationItem": Rel.RESERVATION_ITEM,
  "State": Rel.STATE,
  "User": Rel.USER
});

enum TemplateName { IP_PBX }

final templateNameValues = EnumValues({"IP PBX": TemplateName.IP_PBX});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
