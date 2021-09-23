import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Textform extends StatefulWidget {
  TextEditingController controller;
  // Icons icon;
  String hintText;
  int maxLine;
  Textform({Key key,this.controller, this.hintText, this.maxLine}) : super(key:key) ;
  @override
  _TextformState createState() => _TextformState(controller, hintText, maxLine);
}

class _TextformState extends State<Textform> {
  TextEditingController controller;
  Icon icon;
  String hintText;
  int maxLine;
  _TextformState(this.controller, this.hintText, this.maxLine);
  Color iconColor = Colors.blue;
  Color border_focus = Colors.black45;
  String kosong = "null";
  @override
  Widget build(BuildContext context) {
    return Container(
              //alamat
              // width: 300,
              // height: 200,
              child: TextFormField(
                controller:  widget.controller == kosong ? " " : widget.controller,
                inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                maxLines: widget.maxLine,
                decoration: InputDecoration(
                  isDense: true,
                  // prefixIcon: Icon( ,
                  //   color: iconColor,
                  // ),
                  contentPadding: EdgeInsets.all(20.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: border_focus,
                  )),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: border_focus),
                  ),
                  focusColor: iconColor,
                  labelStyle: TextStyle(color: border_focus),
                  hintStyle: TextStyle(color: border_focus),
                  hintText: widget.hintText,
                ),
              ),
    );
  }
}