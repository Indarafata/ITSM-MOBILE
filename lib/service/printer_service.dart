import 'package:itsm_mobile/const/url.dart';
import 'package:itsm_mobile/model/printer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PrinterService {
  List<PrinterModel> parsePrinter(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<PrinterModel>((json) => PrinterModel.fromJson(json))
        .toList();
  }

  Future<List<PrinterModel>> getAllPrinter() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    var response =
        await http.get(Uri.parse(baseUrl + "apirest.php/Printer"), headers: {
      'Session-Token': "$token",
    });

    // Use the compute function to run parsePrinter in a separate isolate.
    return parsePrinter(response.body);
  }

  static Future<bool> updatePrinter(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var printer = <String, dynamic>{
      "input": [
        {
          "id": id,
          "locations_id": data["locations_id"],
          "comment": data["comment"],
        }
      ]
    };

    var response = await http.put(
        Uri.parse(baseUrl + "apirest.php/Printer/" + id.toString()),
        body: jsonEncode(printer),
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
