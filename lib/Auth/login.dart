import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:formval/screen/home.dart';
import 'package:formval/widget/Buildpasswordtext.dart';
import 'package:formval/widget/buildbutton.dart';
import 'package:formval/widget/buildmailtext.dart';
import 'package:formval/widget/buildnametext.dart';
import 'package:formval/widget/mainbutton.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
   final _formkey = GlobalKey<FormState>();
  checkval(){
     final isval = _formkey.currentState!.validate();

                      

                      if (isval) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      } else
                        return null;
  }

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Center(
          child: Column(

            children: [
               Column(
                 children: [
                   BuildMailText(),
                   BuildPasswordText(),
                 ],
               ),
               MainButton(size, checkval, "vb")
               
            ],
          ),
        ),
      ),
    );
  }
}
