import 'dart:async';
import 'package:itsm_mobile/const/url.dart';
import 'package:itsm_mobile/model/network_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService {
  List<NetworkModel> parseNetwork(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<NetworkModel>((json) => NetworkModel.fromJson(json))
        .toList();
  }

  Future<List<NetworkModel>> getAllNetwork() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Network"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parseNetwork(response.body);
  }
}
