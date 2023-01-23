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
}
