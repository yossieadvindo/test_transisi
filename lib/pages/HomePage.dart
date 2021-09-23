import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_transisi/models/employee.dart';
import 'package:http/http.dart' as http;
import 'package:test_transisi/pages/AddPage.dart';
import 'package:test_transisi/pages/DetailsEmployee.dart';
import 'package:test_transisi/pages/LoginPage.dart';
import 'package:test_transisi/provider/employee.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = new List<Pegawai>();
  var loading = false;
  List pegawaiJSON;

  final String apiUrl = "https://reqres.in/api/users?per_page=15";
  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body)['data'];
  }
  logout() async {
    setState(() {
      Navigator.pushReplacement(this.context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          "Employee",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  logout();
                },
                child: Icon(
                  Icons.logout,
                  size: 26.0,
                ),
              )),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(snapshot.data[index]['avatar']),
                      ),
                      title: Text(snapshot.data[index]['first_name'] +
                          " " +
                          snapshot.data[index]['last_name']),
                      subtitle: Text(snapshot.data[index]['email']),
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_right),
                          color: Colors.indigo,
                          onPressed: () {
                            Navigator.push(
                                this.context,
                                MaterialPageRoute(
                                    builder: (context) => Details_Employee(
                                          employee: Pegawai(
                                            id: snapshot.data[index]['id'],
                                            first_name: snapshot.data[index]
                                                ['first_name'],
                                            last_name: snapshot.data[index]
                                                ['last_name'],
                                            email: snapshot.data[index]
                                                ['email'],
                                            avatar: snapshot.data[index]
                                                ['avatar'],
                                            createdAt: snapshot.data[index]
                                                ['createdAt'],
                                          ),
                                        )));
                          }),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
