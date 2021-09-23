import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_transisi/provider/employee.dart';
import 'package:test_transisi/widgets/textform.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  Employee dataResponse = Employee();
  final nama = TextEditingController();
  final job = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Employee"),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
          padding: EdgeInsets.all(15.0),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textform(
                  controller: nama,
                  hintText: "Name",
                  maxLine: 1,
                ),
                SizedBox(height: 10),
                Textform(
                  controller: job,
                  hintText: "Job",
                  maxLine: 1,
                ),
                SizedBox(height: 10),
                RaisedButton(
                  color: Colors.indigo,
                  hoverColor: Colors.indigoAccent,
                  onPressed: () {
                    Employee.addUser(nama.text, job.text).then(
                      (value) {
                        print(value.name);
                        setState(() {
                          dataResponse = value;
                        });
                      },
                    );
                  },
                  child: Text(
                    "ADD DATA",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                FittedBox(
                  child: Text(
                    (dataResponse.id == null)
                        ? "ID : Belum ada data"
                        : "ID : ${dataResponse.id}",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                FittedBox(
                    child: Text("Name : ", style: TextStyle(fontSize: 20))),
                FittedBox(
                  child: Text(
                    (dataResponse.name == null )
                        ? "Belum ada data"
                        : "${dataResponse.name}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FittedBox(
                    child: Text("Job : ", style: TextStyle(fontSize: 20))),
                FittedBox(
                  child: Text(
                    (dataResponse.job == null)
                        ? "Belum ada data"
                        : "${dataResponse.job}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                FittedBox(
                    child:
                        Text("Created At : ", style: TextStyle(fontSize: 20))),
                FittedBox(
                  child: Text(
                    (dataResponse.createdAt == null)
                        ? "Belum ada data"
                        : "${dataResponse.createdAt}",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ]),
    );
  }
}
