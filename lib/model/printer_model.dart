// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<PrinterModel> PrinterFromJson(String str) => List<PrinterModel>.from(
    json.decode(str).map((x) => PrinterModel.fromJson(x)));

String PrinterToJson(List<PrinterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PrinterModel {
  PrinterModel({
    required this.id,
    required this.entitiesId,
    required this.isRecursive,
    required this.name,
    required this.dateMod,
    required this.contact,
    this.contactNum,
    required this.usersIdTech,
    required this.groupsIdTech,
    required this.serial,
    this.otherserial,
    required this.haveSerial,
    required this.haveParallel,
    required this.haveUsb,
    required this.haveWifi,
    required this.haveEthernet,
    this.comment,
    this.memorySize,
    required this.locationsId,
    required this.networksId,
    required this.printertypesId,
    required this.printermodelsId,
    required this.manufacturersId,
    required this.isGlobal,
    required this.isDeleted,
    required this.isTemplate,
    this.templateName,
    required this.initPagesCounter,
    required this.lastPagesCounter,
    required this.usersId,
    required this.groupsId,
    required this.statesId,
    required this.ticketTco,
    required this.isDynamic,
    this.uuid,
    this.dateCreation,
    this.sysdescr,
    this.lastInventoryUpdate,
    required this.snmpcredentialsId,
    required this.autoupdatesystemsId,
    required this.links,
  });

  int id;
  int entitiesId;
  int isRecursive;
  String name;
  DateTime dateMod;
  String contact;
  String? contactNum;
  int usersIdTech;
  int groupsIdTech;
  String serial;
  Otherserial? otherserial;
  int haveSerial;
  int haveParallel;
  int haveUsb;
  int haveWifi;
  int haveEthernet;
  String? comment;
  String? memorySize;
  int locationsId;
  int networksId;
  int printertypesId;
  int printermodelsId;
  int manufacturersId;
  int isGlobal;
  int isDeleted;
  int isTemplate;
  String? templateName;
  int initPagesCounter;
  int lastPagesCounter;
  int usersId;
  int groupsId;
  int statesId;
  String ticketTco;
  int isDynamic;
  dynamic uuid;
  DateTime? dateCreation;
  dynamic sysdescr;
  dynamic lastInventoryUpdate;
  int snmpcredentialsId;
  int autoupdatesystemsId;
  List<Link> links;

  factory PrinterModel.fromJson(Map<String, dynamic> json) => PrinterModel(
        id: json["id"],
        entitiesId: json["entities_id"],
        isRecursive: json["is_recursive"],
        name: json["name"],
        dateMod: DateTime.parse(json["date_mod"]),
        contact: json["contact"],
        contactNum: json["contact_num"],
        usersIdTech: json["users_id_tech"],
        groupsIdTech: json["groups_id_tech"],
        serial: json["serial"],
        otherserial: otherserialValues.map[json["otherserial"]]!,
        haveSerial: json["have_serial"],
        haveParallel: json["have_parallel"],
        haveUsb: json["have_usb"],
        haveWifi: json["have_wifi"],
        haveEthernet: json["have_ethernet"],
        comment: json["comment"],
        memorySize: json["memory_size"],
        locationsId: json["locations_id"],
        networksId: json["networks_id"],
        printertypesId: json["printertypes_id"],
        printermodelsId: json["printermodels_id"],
        manufacturersId: json["manufacturers_id"],
        isGlobal: json["is_global"],
        isDeleted: json["is_deleted"],
        isTemplate: json["is_template"],
        templateName: json["template_name"],
        initPagesCounter: json["init_pages_counter"],
        lastPagesCounter: json["last_pages_counter"],
        usersId: json["users_id"],
        groupsId: json["groups_id"],
        statesId: json["states_id"],
        ticketTco: json["ticket_tco"],
        isDynamic: json["is_dynamic"],
        uuid: json["uuid"],
        dateCreation: json["date_creation"] == null
            ? null
            : DateTime.parse(json["date_creation"]),
        sysdescr: json["sysdescr"],
        lastInventoryUpdate: json["last_inventory_update"],
        snmpcredentialsId: json["snmpcredentials_id"],
        autoupdatesystemsId: json["autoupdatesystems_id"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "entities_id": entitiesId,
        "is_recursive": isRecursive,
        "name": name,
        "date_mod": dateMod.toIso8601String(),
        "contact": contact,
        "contact_num": contactNum,
        "users_id_tech": usersIdTech,
        "groups_id_tech": groupsIdTech,
        "serial": serial,
        "otherserial": otherserialValues.reverse[otherserial],
        "have_serial": haveSerial,
        "have_parallel": haveParallel,
        "have_usb": haveUsb,
        "have_wifi": haveWifi,
        "have_ethernet": haveEthernet,
        "comment": comment,
        "memory_size": memorySize,
        "locations_id": locationsId,
        "networks_id": networksId,
        "printertypes_id": printertypesId,
        "printermodels_id": printermodelsId,
        "manufacturers_id": manufacturersId,
        "is_global": isGlobal,
        "is_deleted": isDeleted,
        "is_template": isTemplate,
        "template_name": templateName,
        "init_pages_counter": initPagesCounter,
        "last_pages_counter": lastPagesCounter,
        "users_id": usersId,
        "groups_id": groupsId,
        "states_id": statesId,
        "ticket_tco": ticketTco,
        "is_dynamic": isDynamic,
        "uuid": uuid,
        "date_creation": dateCreation?.toIso8601String(),
        "sysdescr": sysdescr,
        "last_inventory_update": lastInventoryUpdate,
        "snmpcredentials_id": snmpcredentialsId,
        "autoupdatesystems_id": autoupdatesystemsId,
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
  PRINTER_TYPE,
  PRINTER_MODEL,
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
  ITEM_DEVICE_GENERIC,
  ITEM_DEVICE_SIMCARD,
  ITEM_DEVICE_SENSOR,
  ITEM_DEVICE_CAMERA,
  USER,
  GROUP
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
  "Item_DeviceProcessor": Rel.ITEM_DEVICE_PROCESSOR,
  "Item_DeviceSensor": Rel.ITEM_DEVICE_SENSOR,
  "Item_DeviceSimcard": Rel.ITEM_DEVICE_SIMCARD,
  "Item_DeviceSoundCard": Rel.ITEM_DEVICE_SOUND_CARD,
  "Item_Project": Rel.ITEM_PROJECT,
  "Item_Ticket": Rel.ITEM_TICKET,
  "Location": Rel.LOCATION,
  "Manufacturer": Rel.MANUFACTURER,
  "NetworkPort": Rel.NETWORK_PORT,
  "PrinterModel": Rel.PRINTER_MODEL,
  "PrinterType": Rel.PRINTER_TYPE,
  "ReservationItem": Rel.RESERVATION_ITEM,
  "State": Rel.STATE,
  "User": Rel.USER
});

enum Otherserial { TLP_RXXXX_13_ICT, EMPTY }

final otherserialValues = EnumValues(
    {"": Otherserial.EMPTY, "TLPRxxxx-13-ICT": Otherserial.TLP_RXXXX_13_ICT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
