import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formval/screen/home.dart';
import 'package:formval/widget/Buildpasswordtext.dart';
import 'package:formval/widget/buildmailtext.dart';
import 'package:formval/widget/buildnametext.dart';
import 'package:formval/widget/buildprofile.dart';
import 'package:formval/widget/buildbutton.dart';
import 'package:formval/widget/builldabouttext.dart';
import 'package:formval/widget/datepicker.dart';
import 'package:formval/widget/drop.dart';
import 'package:formval/widget/mainbutton.dart';
import 'package:intl/intl.dart';

class CreateUser extends StatefulWidget {
  CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formkey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';
  String sexvalue = '';
  bool flag = false;

  final usernamec = TextEditingController();
  final aboutc = TextEditingController();
  String? about;
  getname(String name) {
    setState(() {
      username = name;
    });
  }

  getsexValue(String name) {
    setState(() {
      flag = !flag;
      sexvalue = name;
    });
  }

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

    if (isval) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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

  bool Value = true;
  late DateTime date;
  final datefor = DateFormat('MM');
  final datefor1 = DateFormat('dd');
  final datefor2 = DateFormat('yyy');
  DateTime datee = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
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
                            Text('名前 [必須]'),
                            BuildNameText(getname),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            Text('メールアドレス[必須]'),
                            BuildMailText(),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            Text("パスワード[必須]"),
                            BuildPasswordText(),
                            SizedBox(
                              height: size.height / 80,
                            ),
                            Text("性別[必須]"),
                            Row(
                              children: [
                                BuildButton(
                                    getsexValue,
                                    '男性',
                                    sexvalue == '男性'
                                        ? flag = true
                                        : flag = false),
                                BuildButton(
                                    getsexValue,
                                    '女性',
                                    sexvalue == '女性'
                                        ? flag = true
                                        : flag = false)
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
                        child: Text("生年月日[必須]")),
                  ],
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Datepicker(datee, size, datefor2, datefor1, datefor),
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
                        Text('プロファール画像「必須」'),
                        buildProfile(),
                        Text('「自己紹介必須」'),
                        BuildAboutText(),
                      ],
                    ),
                  ],
                ),
                MainButton(size, checkval, '登録する')
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
                Text("プロファイに表示しない"),
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
