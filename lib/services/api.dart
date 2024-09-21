import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'http://192.168.56.177:3000/api/';

  //POST

  static addPerson(Map data) async {
    // print(data);
    var url = Uri.parse("${baseUrl}add_person");
    try {
      final res = await http.post(url, body: data);

      if (res.statusCode == 201) {
        var jsondata = jsonEncode(res.body.toString());
        // print(jsondata);
      } else {
        print('FAILED to upload DATA');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  //GET

  static Future<List<Person>> getPerson() async {
    List<Person> person = [];
    var url = Uri.parse("${baseUrl}get_person");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var jsondata = jsonDecode(res.body);
        // print(jsondata);
        jsondata['person'].map((value) {
          return Person(
              name: value['name'], phone: value['phone'], age: value['age']);
        });
        return person;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
