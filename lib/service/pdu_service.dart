import 'package:itsm_mobile/const/url.dart';
import 'package:itsm_mobile/model/pdu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PduService {
  List<PduModel> parsePdu(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<PduModel>((json) => PduModel.fromJson(json)).toList();
  }

  Future<List<PduModel>> getAllPdu() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Pdu"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parseComputer in a separate isolate.
    return parsePdu(response.body);
  }
}
