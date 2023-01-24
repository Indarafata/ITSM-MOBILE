import 'dart:async';
import 'package:itsm_mobile/const/url.dart';
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
}
