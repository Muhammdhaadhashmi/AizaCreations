import 'dart:convert';
import 'dart:io';

import 'package:aizacreationzz/AppModules/Utils/LocalDataBaseHandler.dart';
import 'package:aizacreationzz/AppModules/Utils/Networking/NetworkApis.dart';
import 'package:http/http.dart' as http;

class ApiCall {
  createAccount(String apiUrl, Map bodyparameter) async {
    final response = await http.post(
      Uri.parse("${ApisUtills().baseUrl + apiUrl}"),
      headers: <String, String>{
        // "Accept":"/*/",
        'Content-Type': 'application/json',
        // 'x-api-key': 'CODEX@123',
        // 'Authorization': 'CODEX@123',
      },
      body: jsonEncode(bodyparameter),
    );
    print(response.statusCode);
    // print(jsonDecode(response.body));
    // if (response.statusCode == 200) {
    //   return response;
    // }
    // if (response.statusCode == 400) {
    //
    // }
    return response;
    // else {
    //   throw Exception('Failed to create album.');
    // }
  }

  postRequest(
    String apiUrl,
    Map bodyparameter,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${ApisUtills().baseUrl + apiUrl}"),
        headers: {
          // 'accept': '*/*',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(bodyparameter),
      );
      print(response.statusCode);
      // print(jsonDecode(response.body));
      // if (response.statusCode == 200) {
      return response;
      // // } else {
      //   throw Exception('Failed to create album.');
      // }
      //Connection timed out
    } catch (e) {
      if (e.toString().contains("Connection timed out")) {
        return true;
      }
    }
  }

  postRequest1(
    String apiUrl,
    Map bodyparameter,
  ) async {
    try {
      final response = await http.post(
        Uri.parse("${ApisUtills().baseUrl + apiUrl}"),
        headers: {
          'accept': '*/*',
          'Content-Type': 'application/json-patch+json'
        },
        body: jsonEncode(bodyparameter),
      );
      print(response.statusCode);
      // print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to create album.');
      }
      //Connection timed out
    } catch (e) {
      if (e.toString().contains("Connection timed out")) {
        return true;
      }
    }
  }

  postRequestHeader(
    String apiUrl,
    Map bodyparameter,
  ) async {
    var token = await DatabaseHandler().getToken();
    print(token);
    try {
      final response = await http.post(
        Uri.parse("${ApisUtills().baseUrl + apiUrl}"),
        headers: {
          "Accept": "*/*",
          'Content-Type': 'application/json-patch+json',
          "Authorization": "bearer ${token.toString()}",
        },
        body: jsonEncode(bodyparameter),
      );
      print(response.statusCode);
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to create album.');
      }
      //Connection timed out
    } catch (e) {
      if (e.toString().contains("Connection timed out")) {
        return true;
      }
    }
  }

  putRequest(String apiUrl, Map bodyparameter) async {
    try {
      // ignore: unused_local_variable
      var token = await DatabaseHandler().getToken();
      final response = await http.put(
        Uri.parse("${ApisUtills().baseUrl + apiUrl}"),
        headers: {
          "Accept": "application/json",
          // "Authorization": "bearer ${token.toString()}",
        },
        body: jsonEncode(bodyparameter),
      );
      print(response.statusCode);
      print(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to create album.');
      }
      //Connection timed out
    } catch (e) {
      if (e.toString().contains("Connection timed out")) {
        return true;
      }
    }
  }

  updateProfile(String apiUrl, String input) async {
    String requestData = "action=GetProperties&request=";
    requestData += Uri.encodeComponent(input);
    // String url = "http://blogwtproject.appspot.com/api/blog";
    http.Response r = await http.post(
        Uri.parse("${ApisUtills().baseUrl + apiUrl}"),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: requestData);
    print(r.toString());
    return r;
  }

  getRequest(String apiUrl) async {
    // ignore: unused_local_variable
    var token = await DatabaseHandler().getToken();
    final response = await http.get(
      Uri.parse("${ApisUtills().baseUrl + apiUrl}"),
      // Send authorization headers to the backend.
      headers: {
        // "accept":'*/*',
        // "Authorization": "bearer ${token.toString()}",
      },
    );
    final responseJson = jsonDecode(response.body);
// print("responseJson");
// print(responseJson);
    if (response.statusCode == 200) {
      // print(responseJson["message"]);
      return responseJson;
    } else {
      return "";
    }

    // return Album.fromJson(responseJson);
  }

  Future<http.Response> updateAlbum(String title) {
    return http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
  }

  Future uploadfile(
      {required String url,
      required String name,
      required File imgFile}) async {
    var token = await DatabaseHandler().getToken();
    print(token);
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("${ApisUtills().baseUrl + url}"),
    );
    request.headers['accept'] = '*/*';
    request.headers["Content-Type"] = 'multipart/form-data';
    request.headers["Authorization"] = 'bearer $token';
    // request.fields["name"] = name;
    var pic =
        await http.MultipartFile.fromPath("Attatchment", imgFile.path.trim());
    request.files.add(pic);
    var response = await request.send();
    var result = await http.Response.fromStream(response);
    print(json.decode(result.body)['data']);
    return jsonDecode(result.body);
    // print(response.toString());
    // var responseData = await response.stream.toBytes();
    // var responseString = String.fromCharCodes(responseData);
    // print(responseString);
    // print(response. + "my code");
    // return responseData;
  }
}
