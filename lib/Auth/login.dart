import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:formval/Auth/createuser.dart';
import 'package:formval/Auth/forgotpass.dart';
import 'package:formval/screen/home.dart';
import 'package:formval/widget/Buildpasswordtext.dart';
import 'package:formval/widget/buildbutton.dart';
import 'package:formval/widget/buildmailtext.dart';
import 'package:formval/widget/buildnametext.dart';
import 'package:formval/widget/mainbutton.dart';

import 'methods.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formkey = GlobalKey<FormState>();
  movetocreateUser() {
   
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CreateUser()));
  
  }

  getmail(value) {
    setState(() {
      gmail = value;
    });
  }

  getpass(value) {
    setState(() {
      pass = value;
    });
  }

  bool isLoading = false;

  TextEditingController gmail = TextEditingController();
  TextEditingController pass = TextEditingController();

  checkval(){
    final isval = _formkey.currentState!.validate();
                            if(isval){
                              logIn(gmail.text, pass.text).then((user) {
                              print('done');
                              if (user != null) {
                                print("Login Sucessfull");
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => Home()));
                              } 
                            });
                            }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: isLoading
            ? Center(
                child: Container(
                  height: size.height / 20,
                  width: size.height / 20,
                  child: CircularProgressIndicator(),
                ),
              )
            : Form(
                key: _formkey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          BuildMailText(getmail, gmail),
                          SizedBox(
                            height: 10,
                          ),
                          BuildPasswordText(getpass, pass),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MainButton(size, movetocreateUser, "新登録"),
                      
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ForgotPassword()));
                          },
                          child: Text('パスワードを忘れた方',style: TextStyle(color: Colors.black),)),
                          MainButton(size, checkval, 'ログイン')
                     
                    ],
                  ),
                ),
              ));
  }
}
