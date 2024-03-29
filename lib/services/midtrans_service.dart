import 'dart:convert';
import 'package:bwa_masteringflutter/shared/api_url.dart';
import 'package:http/http.dart' as http;

class MidtransService{
  Future<String> createTopUpOrder(String uid, int balance, String name) async {

    try {
      var requestData = {
        'name': name,
        'user_id': uid,
        'total_topup': balance,
      };

      var response = await http.post(
        Uri.parse(topUpAPi),
        body: jsonEncode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonData = response.body;
        return jsonData;
      } else {
        return response.statusCode.toString();
      }
    } catch (error) {
      return 'error';
    }
  }
}

