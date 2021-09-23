import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_transisi/pages/HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  final _key = GlobalKey<FormState>();
  bool visible = false;

  void alertLogin(BuildContext context) {
    setState(() {
      visible = false;
    });
    var alertDialog = AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Email dan Password Tidak Sesuai"),
      content: Text("Coba Ulangi lagi"),
      actions: <Widget>[
        FlatButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ulang")),
      ],
      elevation: 20.0,
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
      barrierDismissible: false,
    );
  }

  cek() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      doLogin();
      print("user $email");
      print("ini $password");
    }
  }

  Future<List> doLogin() async {
    setState(() {
      visible = true;
    });
    var url = "https://reqres.in/api/login";
    var body = {"email": email, "password": password};
    var response = await http.post(url, body: body);

    final data = jsonDecode(response.body);
    if (data != null) {
      Navigator.pushReplacement(this.context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      print(data["token"]);
    }
  }

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Email'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        onSaved: (e) => email = e,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))),
                        validator: (val) => val.isNotEmpty
                            ? null
                            : 'Username tidak boleh kosong',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Password'),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        obscureText: _secureText,
                        onSaved: (e) => password = e,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            suffixIcon: IconButton(
                              color: Colors.indigo,
                                icon: Icon(_secureText
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: showHide),
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 14),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))),
                        validator: (val) => val.isNotEmpty
                            ? null
                            : 'Password tidak boleh kosong',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.indigo)),
                          onPressed: () {
                            cek();
                          },
                          color: Colors.indigo,
                          textColor: Colors.white,
                          child: Text("LOGIN".toUpperCase(),
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      Visibility(
                          visible: visible,
                          child: Container(
                              padding: EdgeInsets.all(50),
                              margin: EdgeInsets.only(bottom: 30),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
