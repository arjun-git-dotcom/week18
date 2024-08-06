import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/models/model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = 'http://192.168.60.90:3000/api/';

  //POST

  static addPerson(Map data) async {
    print(data);
    var url = Uri.parse("${baseUrl}add_person");
    try {
      final res = await http.post(url, body: data);

      if (res.statusCode == 200) {
        var jsondata = jsonDecode(res.body.toString());
        print(jsondata);
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
        print(jsondata);
        jsondata['person']?.forEach((value) => {
              person.add(Person(
                  name: value['name'],
                  phone: value['phone'],
                  age: value['age']))
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
