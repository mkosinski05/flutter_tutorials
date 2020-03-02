import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_db_app/services/User.dart';
import 'package:flutter_db_app/services/persistFile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  User user = User(name: null, NumOfAddr: 0, address: null);
  PersistFile pFile = PersistFile("Test.txt");

  void fetchData () async {
    try {
      var data = await pFile.readFile();
      //print (data);
      var json = await jsonDecode(data);
      print (json);
      this.user = User.fromJson(json);

      print (user.address[0].city);
    } catch (e) {  }
  }
  @override
  void initState () {
    // TODO: implement initState
    super.initState();

    String value = '{"name" : "John", "address" : [{"street" : "My st.", "city" : "New York"}]}';
    var json = jsonDecode(value);
    //this.user = User.fromJson(this.json);
    //print("${user.toJson()}");
    //print("${user.address[0].city}");
    pFile.writeFile(jsonEncode(json));

    fetchData();


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: Scaffold (
        appBar: AppBar (
          title: Text('Test'),
        ),
        body: Container(
          child: Text('body'),
        ),

      ),
    );
  }
}

