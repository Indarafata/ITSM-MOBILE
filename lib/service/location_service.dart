import 'package:itsm_mobile/const/url.dart';
import 'package:itsm_mobile/model/location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/device_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationService {
  static List<LocationModel> parseLocation(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<LocationModel>((json) => LocationModel.fromJson(json))
        .toList();
  }

  static Future<LocationModel> getLocation(String location) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response = await http.get(Uri.parse(location), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    // return parseLocation(response.body);
    return LocationModel.fromJson(jsonDecode(response.body));
  }
}
