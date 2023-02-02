import 'dart:async';
import 'package:itsm_mobile/const/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/computer_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComputerService {
  List<ComputerModel> parseComputer(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<ComputerModel>((json) => ComputerModel.fromJson(json))
        .toList();
  }

  Future<List<ComputerModel>> getAllComputer() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Computer"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parseComputer(response.body);
  }

  static Future<bool> updateComputer(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var computer = <String, dynamic>{
      "input": [
        {
          "id": id,
          "locations_id": data["locations_id"],
        }
      ]
    };

    var response = await http.put(
        Uri.parse(baseUrl + "apirest.php/Computer/" + id.toString()),
        body: jsonEncode(computer),
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
