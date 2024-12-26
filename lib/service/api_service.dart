import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quickalert/quickalert.dart';

class CommonApiServices {
  static var client = http.Client();


// instead of local host we should declare machine Ip(10.0.2.2) - to run emulatore
  final baseUrl = 'http://10.0.2.2:8000/api/v1'; 

  Future<dynamic> fetchData(String apiUrl) async {
    var url = Uri.parse(baseUrl + apiUrl);
      var header = {
        'Content-Type': 'application/json'
      };
      final response = await client.get(url, headers: header);
      if(response.statusCode == 200){
        return response.body;
      } else {
        throw json.decode(response.body);
      }
  }

  Future<dynamic> saveData( String apiUrl, dynamic body, BuildContext context) async {
    var url = Uri.parse(baseUrl + apiUrl);
    var header = {
        'Content-Type': 'application/json'
      };


      final response = await client.post(url, body: body, headers: header);
      if (response.statusCode == 201){
        return response.body;
      } else {
        var body = json.decode(response.body); 
        QuickAlert.show(
          // ignore: use_build_context_synchronously
          context: context, 
          type: QuickAlertType.error, 
          text: body['error'], 
          showConfirmBtn: false,
          animType: QuickAlertAnimType.slideInUp,
        );
        return body;
      }
    
  }

Future deleteData(String apiUrl) async {
  var url = Uri.parse(baseUrl + apiUrl);
    var header = {
        'Content-Type': 'application/json'
      };

      final response = await client.delete(url, headers: header);
      if (response.statusCode == 200){
        return response.body;
      } else {
        throw json.decode(response.body);
      }
}

}