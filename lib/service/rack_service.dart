import 'package:itsm_mobile/const/url.dart';
import 'package:itsm_mobile/model/rack_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RackService {
  List<RackModel> parseRack(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<RackModel>((json) => RackModel.fromJson(json)).toList();
  }

  Future<List<RackModel>> getAllRack() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Rack"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parseRack(response.body);
  }
}
