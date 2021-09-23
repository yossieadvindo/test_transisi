import 'package:flutter/material.dart';

class Pegawai {
  String  email, first_name, last_name,avatar;
  DateTime createdAt, updatedAt;
  int id;
  Pegawai({
    @required this.id,
    @required this.email,
    @required this.first_name,
    @required this.last_name,
    @required this.avatar,
    this.createdAt
  });

  factory Pegawai.fromJson(Map <String, dynamic> json){
    return new Pegawai(
            id: json['id'],
            email: json['email'],
            first_name: json['first_name'],
            last_name: json['last_name'],
            avatar: json['avatar'],
            createdAt: json['createdAt'],
    );
  }
}
