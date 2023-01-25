// To parse this JSON data, do
//
//     final ComputerModel = ComputerModelFromJson(jsonString);

import 'dart:convert';

String ComputerModelToJson(List<ComputerModel?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

// ComputerModel eventsModelFromJson(String str) =>
//     ComputerModel.fromJson(json.decode(str));
// String eventsModelToJson(ComputerModel data) => json.encode(data.toJson());

class ComputerModel {
  ComputerModel({
        required this.id,
        required this.entitiesId,
        required this.name,
        required this.serial,
        required this.otherserial,
        required this.contact,
        required this.contactNum,
        required this.usersIdTech,
        required this.groupsIdTech,
        required this.comment,
        required this.dateMod,
        required this.autoupdatesystemsId,
        required this.locationsId,
        required this.networksId,
        required this.computermodelsId,
        required this.computertypesId,
        required this.isTemplate,
    required this.templateName,
        required this.manufacturersId,
        required this.isDeleted,
        required this.isDynamic,
        required this.usersId,
        required this.groupsId,
        required this.statesId,
        required this.ticketTco,
        required this.uuid,
        required this.dateCreation,
        required this.isRecursive,
        required this.lastInventoryUpdate,
        required this.links,
    });

    int? id;
    int? entitiesId;
  String name;
    String? serial;
    String? otherserial;
    String? contact;
    ContactNum? contactNum;
    int? usersIdTech;
    int? groupsIdTech;
    String? comment;
    DateTime? dateMod;
    int? autoupdatesystemsId;
    int? locationsId;
    int? networksId;
    int? computermodelsId;
    int? computertypesId;
    int? isTemplate;
  String? templateName;
    int? manufacturersId;
    int? isDeleted;
    int? isDynamic;
    int? usersId;
    int? groupsId;
    int? statesId;
    String? ticketTco;
    String? uuid;
    dynamic dateCreation;
    int? isRecursive;
    dynamic lastInventoryUpdate;
  List<Link> links;

  factory ComputerModel.fromJson(Map<String, dynamic> json) => ComputerModel(
        id: json["id"],
        entitiesId: json["entities_id"],
        name: json["name"],
        serial: json["serial"],
        otherserial: json["otherserial"],
        contact: json["contact"],
        contactNum: contactNumValues.map[json["contact_num"]],
        usersIdTech: json["users_id_tech"],
        groupsIdTech: json["groups_id_tech"],
        comment: json["comment"],
        dateMod: DateTime.parse(json["date_mod"]),
        autoupdatesystemsId: json["autoupdatesystems_id"],
        locationsId: json["locations_id"],
        networksId: json["networks_id"],
        computermodelsId: json["computermodels_id"],
        computertypesId: json["computertypes_id"],
        isTemplate: json["is_template"],
        templateName: json["template_name"],
        manufacturersId: json["manufacturers_id"],
        isDeleted: json["is_deleted"],
        isDynamic: json["is_dynamic"],
        usersId: json["users_id"],
        groupsId: json["groups_id"],
        statesId: json["states_id"],
        ticketTco: json["ticket_tco"],
        uuid: json["uuid"],
        dateCreation: json["date_creation"],
        isRecursive: json["is_recursive"],
        lastInventoryUpdate: json["last_inventory_update"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "entities_id": entitiesId,
        "name": name,
        "serial": serial,
        "otherserial": otherserial,
        "contact": contact,
        "contact_num": contactNumValues.reverse![contactNum],
        "users_id_tech": usersIdTech,
        "groups_id_tech": groupsIdTech,
        "comment": comment,
        "date_mod": dateMod?.toIso8601String(),
        "autoupdatesystems_id": autoupdatesystemsId,
        "locations_id": locationsId,
        "networks_id": networksId,
        "computermodels_id": computermodelsId,
        "computertypes_id": computertypesId,
        "is_template": isTemplate,
        "template_name": templateName,
        "manufacturers_id": manufacturersId,
        "is_deleted": isDeleted,
        "is_dynamic": isDynamic,
        "users_id": usersId,
        "groups_id": groupsId,
        "states_id": statesId,
        "ticket_tco": ticketTco,
        "uuid": uuid,
        "date_creation": dateCreation,
        "is_recursive": isRecursive,
        "last_inventory_update": lastInventoryUpdate,
        "links": links == null
            ? []
            : List<dynamic>.from(links.map((x) => x.toJson())),
    };
}

enum ContactNum { EMPTY, CO_BEACUKAI, KARANTINA }

final contactNumValues = EnumValues({
    "CO BEACUKAI": ContactNum.CO_BEACUKAI,
    "": ContactNum.EMPTY,
    "KARANTINA": ContactNum.KARANTINA
});

class Link {
    Link({
        required this.rel,
        required this.href,
    });

    Rel? rel;
  String href;

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        rel: relValues.map[json["rel"]],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "rel": relValues.reverse![rel],
        "href": href,
    };
}

enum Rel { ENTITY, USER, GROUP, LOCATION, COMPUTER_MODEL, COMPUTER_TYPE, MANUFACTURER, STATE, RESERVATION_ITEM, DOCUMENT_ITEM, CONTRACT_ITEM, INFOCOM, ITEM_TICKET, ITEM_PROJECT, NETWORK_PORT, ITEM_DEVICE_MOTHERBOARD, ITEM_DEVICE_FIRMWARE, ITEM_DEVICE_PROCESSOR, ITEM_DEVICE_MEMORY, ITEM_DEVICE_HARD_DRIVE, ITEM_DEVICE_NETWORK_CARD, ITEM_DEVICE_DRIVE, ITEM_DEVICE_BATTERY, ITEM_DEVICE_GRAPHIC_CARD, ITEM_DEVICE_SOUND_CARD, ITEM_DEVICE_CONTROL, ITEM_DEVICE_PCI, ITEM_DEVICE_CASE, ITEM_DEVICE_POWER_SUPPLY, ITEM_DEVICE_GENERIC, ITEM_DEVICE_SIMCARD, ITEM_DEVICE_SENSOR, ITEM_DEVICE_CAMERA, NETWORK }

final relValues = EnumValues({
    "ComputerModel": Rel.COMPUTER_MODEL,
    "ComputerType": Rel.COMPUTER_TYPE,
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
    "Network": Rel.NETWORK,
    "NetworkPort": Rel.NETWORK_PORT,
    "ReservationItem": Rel.RESERVATION_ITEM,
    "State": Rel.STATE,
    "User": Rel.USER
});

enum TemplateName { HP_PRO_3330_MICROTOWER, HP_Z230, HP_Z200, HP_PAVILION_SLIMLINE_400, HP_PAVILLION_SLIMLINE_400511_X_DT }

final templateNameValues = EnumValues({
    "HP Pavilion Slimline 400": TemplateName.HP_PAVILION_SLIMLINE_400,
    "HP Pavillion Slimline 400-511x DT": TemplateName.HP_PAVILLION_SLIMLINE_400511_X_DT,
    "HP Pro 3330 Microtower": TemplateName.HP_PRO_3330_MICROTOWER,
    "HP Z200": TemplateName.HP_Z200,
    "HP Z230": TemplateName.HP_Z230
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
