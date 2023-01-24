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

  Future<List<PhoneModel>> getAllComputer() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Phone"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parsePhone(response.body);
  }
}
