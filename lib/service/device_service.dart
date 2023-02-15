import 'package:itsm_mobile/const/url.dart';
import 'package:itsm_mobile/model/device_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/device_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DeviceService {
  List<DeviceModel> parseDevice(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<DeviceModel>((json) => DeviceModel.fromJson(json))
        .toList();
  }

  Future<List<DeviceModel>> getAllDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/peripheral"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parseDevice(response.body);
  }

  static Future<bool> updateDevice(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var device = <String, dynamic>{
      "input": [
        {
          "id": id,
          "locations_id": data["locations_id"],
          "comment": data["comment"],
        }
      ]
    };

    var response = await http.put(
        Uri.parse(baseUrl + "apirest.php/peripheral/" + id.toString()),
        body: jsonEncode(device),
        headers: {
          'Content-Type': 'application/json',
          'Session-Token': "$token",
          'App-Token': "7bQel7pg7QiKE94I0L9WhRcQ7RvDeKKjUxK4Idy3",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      // throw Exception("Gagal Terhubung ke Server");
      throw Exception(id.toString());
    }
  }
}
