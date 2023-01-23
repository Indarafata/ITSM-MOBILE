import 'dart:convert';
import 'package:itsm_mobile/const/url.dart';
import 'package:http/http.dart' as http;
import 'package:itsm_mobile/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static Future<LoginModel> authLogin(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    var response = await http
        .post(Uri.parse(baseUrl + "apirest.php/initSession"), headers: {
      'Content-Type': "application/json'",
      'Authorization': "basic " + data['authorization'],
      'App-Token': "7bQel7pg7QiKE94I0L9WhRcQ7RvDeKKjUxK4Idy3",
    });

    if (response.statusCode == 200) {
      Map<dynamic, dynamic> temp = jsonDecode(response.body);
      await prefs.setString('token', temp['session_token']);
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      return LoginModel.fromJson(jsonDecode(response.body));
    }
  }
}
