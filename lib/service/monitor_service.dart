import 'dart:async';
import 'package:itsm_mobile/const/url.dart';
import 'package:itsm_mobile/modules/monitors/views/monitor_update.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/monitor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MonitorService {
  List<MonitorModel> parseMonitor(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<MonitorModel>((json) => MonitorModel.fromJson(json))
        .toList();
  }

  Future<List<MonitorModel>> getAllMonitor() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Monitor"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parseMonitor(response.body);
  }

  static Future<bool> updateMonitor(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var monitor = <String, dynamic>{
      "input": [
        {
          "id": id,
          "locations_id": data["locations_id"],
          "comment": data["comment"],
        }
      ]
    };

    var response = await http.put(
        Uri.parse(baseUrl + "apirest.php/Monitor/" + id.toString()),
        body: jsonEncode(monitor),
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
