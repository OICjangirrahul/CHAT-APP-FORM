import 'package:flutter/material.dart';
import 'package:formval/Auth/login.dart';
import 'package:formval/providers/createpro.dart';
import 'package:formval/widget/drop.dart';
import 'package:provider/provider.dart';

import 'Auth/createuser.dart';

void main() {
  runApp(MyApp( ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: ChangeNotifierProvider(create: (context)=>CreateUserPro(),
      
      child:  CreateUser(),
      )
      
    );
  }
}

