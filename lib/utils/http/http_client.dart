import 'dart:convert';

import 'package:http/http.dart' as http;
class THttpHelper{
  static const String baseUrl="";
  static Future<Map<String,dynamic>>get(String endpoint)async{
  final response=await http.get(Uri.parse('$baseUrl/$endpoint'));
  return _handleResponse(response);
  }

  static Future<Map<String,dynamic>>post(String endpoint,dynamic data)async{
  final response=await http.post(Uri.parse('$baseUrl/$endpoint'),headers: {'Content-Type':'application/json'},body: json.encode(data));
  return _handleResponse(response);
  }

  static Map<String,dynamic> _handleResponse(http.Response response){
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      throw Exception('Failed to load data:${response.statusCode}');
    }
  }
}