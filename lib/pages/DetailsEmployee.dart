import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_transisi/models/employee.dart';

class Details_Employee extends StatefulWidget {
  Pegawai employee;
  Details_Employee({Key key, this.employee}) : super(key: key);

  @override
  _Details_EmployeeState createState() => _Details_EmployeeState(employee);
}

class _Details_EmployeeState extends State<Details_Employee> {
  Color background = Color(0xffFAFAFA);
  Color icon = Colors.indigo;
  Color border_focus = Colors.black45;
  Pegawai employee;
  _Details_EmployeeState(this.employee);
  bool _loading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          actions: [Icon(Icons.edit), Icon(Icons.favorite)],
        ),
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Container(
                color: Colors.indigo,
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Center(
                      child: Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          (employee.avatar == null)
                              ? "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-"
                              : employee.avatar,
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FittedBox(
                          child:
                              Text("Name : ", style: TextStyle(fontSize: 20))),
                      FittedBox(
                        child: Text(
                          (employee.first_name == null &&
                                  employee.last_name == null)
                              ? "Belum ada data"
                              : "${employee.first_name}" +
                                  " " +
                                  "${employee.last_name}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        color: icon,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        (employee.email == null)
                          ? "Belum ada data"
                          : "${employee.email}",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                
                  SizedBox(height: 20),
                  FittedBox(
                      child: Text("Created At : ",
                          style: TextStyle(fontSize: 20))),
                  FittedBox(
                    child: Text(
                      (employee.createdAt == null)
                          ? "Belum ada data"
                          : "${employee.createdAt}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              )
            ],
          ),
        ));
  }
}
