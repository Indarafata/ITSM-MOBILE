import 'dart:async';
import 'package:itsm_mobile/const/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/phone_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhoneService {
  List<PhoneModel> parsePhone(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<PhoneModel>((json) => PhoneModel.fromJson(json)).toList();
  }

  Future<List<PhoneModel>> getAllPhone() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Phone"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parsePhone(response.body);
  }

  static Future<bool> updatePhone(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var phone = <String, dynamic>{
      "input": [
        {
          "id": id,
          "locations_id": data["locations_id"],
          "comment": data["comment"],
        }
      ]
    };

    var response = await http.put(
        Uri.parse(baseUrl + "apirest.php/phone/" + id.toString()),
        body: jsonEncode(phone),
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
