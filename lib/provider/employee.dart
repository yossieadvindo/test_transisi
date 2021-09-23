import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Employee with ChangeNotifier {
String id, name, job, createdAt;

  Employee({this.createdAt, this.id, this.job, this.name});

  static Future<Employee> addUser(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var hasilResponse = await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    );

    var data = json.decode(hasilResponse.body);

    return Employee(
      id: data["id"],
      name: data["name"],
      job: data["job"],
      createdAt: data["createdAt"],
    );
  }

  
}