import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formval/Auth/methods.dart';

import 'package:formval/screen/home.dart';
import 'package:formval/widget/Buildpasswordtext.dart';
import 'package:formval/widget/buildmailtext.dart';
import 'package:formval/widget/buildnametext.dart';
import 'package:formval/widget/buildprofile.dart';
import 'package:formval/widget/buildbutton.dart';
import 'package:formval/widget/builldabouttext.dart';
import 'package:formval/widget/datepicker.dart';

import 'package:formval/widget/mainbutton.dart';

import 'package:intl/intl.dart';


class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formkey = GlobalKey<FormState>();

  String gender = '';
  bool flag = false;

  TextEditingController name = TextEditingController();
  TextEditingController gmail = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController about = TextEditingController();



  getname(value) {
    setState(() {
      name = value;
  
    });
  }

  getabout(value) {
    about = value;

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

  getsgenderValue(String name) {
    setState(() {
      gender = name;
      
    });
  }

  getimagepath(value) {
    imageFile = value;
  }

  File? imageFile;
  bool isLoading = false;

  // List<String> _dropDownMenuYear = [
  //   '1994',
  //   '1995',
  //   '1996',
  //   '1997',
  //   '1998',
  //   '1999',
  //   '2000',
  //   '000000'
  // ];
  // List<String> _dropDownMenuMonth = [
  //   '1',
  //   '2',
  //   '3',
  //   '4',
  //   '5',
  //   '6',
  //   '7',
  //   '8',
  //   '9',
  //   '10',
  //   '11',
  //   '12'
  // ];
  checkval() {
    final isval = _formkey.currentState!.validate();

    if (gender == '') {
      print(dateval);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            '????????????????????????',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } else if (imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'shashin?????????????????????',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
    } else if (isval) {
      createAccount(name.text, gmail.text, pass.text, gender,
              dateval.toString(), imageFile.toString(), about.text)
          .then((user) {
        // ignore: avoid_print
        print("Account Created Sucessfull");
        setState(() {
                isLoading = false;
              });
        if (user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
          // ignore: avoid_print
          print("Account Created Sucessfull");
        } else {
          // ignore: avoid_print
          print('faild');
          
        }
      });
    } else
      return null;
  }

  // gettan(String? newValue) {
  //   setState(() {
  //     _selectedKeyMonth = newValue;
  //   });
  // }

  // // String? _selectedKeyYear;
  // // String? _selectedKeyMonth;

  DateTime? dateval;
  final datefor = DateFormat('dd');
  final datefor1 = DateFormat('MM');
  final datefor2 = DateFormat('yyyy');

  bool Value = true;
  gettime(value) {
    dateval = value;
 
  }

  @override
  Widget build(BuildContext context) {
  
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: 
      SafeArea(
        child: SingleChildScrollView(
          child:isLoading
          ? Center(
              child: SizedBox(
                height: size.height / 20,
                width: size.height / 20,
                child: const CircularProgressIndicator(),
              ),
            ):
        
           Form(
            key: _formkey,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            SizedBox(
                              height: size.height / 80,
                            ),
                            const Text('?????? [??????]'),
                            BuildNameText(getname, name),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            const Text('?????????????????????[??????]'),
                            BuildMailText(getmail, gmail),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            const Text("???????????????[??????]"),
                            BuildPasswordText(getpass, pass),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            const Text("??????[??????]"),
                            Row(
                              children: [
                                BuildButton(
                                  gender == '??????' ? flag = true : flag = false,
                                  getsgenderValue,
                                  '??????',
                                ),
                                BuildButton(
                                  gender == '??????' ? flag = true : flag = false,
                                  getsgenderValue,
                                  '??????',
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                buildswitch(Value, size),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: size.width * 0.05),
                        child: const Text("????????????[??????]")),
                  ],
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Datepicker(size, datefor2, datefor1, datefor, gettime),
                      // Container(
                      //   margin: EdgeInsets.only(top: 4),
                      //   width: size.width * 0.90,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       BuildDrop(
                      //         _dropDownMenuMonth,
                      //         _selectedKeyMonth,
                      //         gettan,
                      //         size,
                      //         '   Year   ',
                      //       ),
                      //       Text('/'),
                      //       BuildDrop(
                      //         _dropDownMenuMonth,
                      //         _selectedKeyMonth,
                      //         gettan,
                      //         size,
                      //         'month',
                      //       ),
                      //       Text('/'),

                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildswitch(Value, size),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('????????????????????????????????????'),
                        buildProfile(imageFile, getimagepath),
                        const Text('????????????????????????'),
                        BuildAboutText(getabout, about),
                      ],
                    ),
                  ],
                ),
                MainButton(size, checkval, '????????????'),
              ],
            ),
          ),
        ),
      ),
    );
    // ignore: dead_code
  }

  Widget buildswitch(Value, size) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Row(
              children: [
                const Text("?????????????????????????????????"),
                Switch.adaptive(
                    value: Value,
                    activeColor: Colors.white,
                    activeTrackColor: Colors.grey,
                    onChanged: (Value) => setState(() {
                          this.Value = Value;
                        })),
              ],
            ),
          ),
        ],
      );
}
