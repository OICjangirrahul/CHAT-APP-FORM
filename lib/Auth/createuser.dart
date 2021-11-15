import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formval/screen/home.dart';
import 'package:formval/widget/Buildpasswordtext.dart';
import 'package:formval/widget/buildmailtext.dart';
import 'package:formval/widget/buildnametext.dart';
import 'package:formval/widget/buildprofile.dart';
import 'package:formval/widget/buildbutton.dart';
import 'package:formval/widget/builldabouttext.dart';

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

  //  List<String> _dropDownMenuYear = [
  //   'Study': ['Math', 'Englsih', 'Japanese'],
  //   'Workout': ['Shoulder', 'Chest', 'Back'],
  //   'Coding': ['Flutter', 'Python', 'C#']
  //  ];
  List<String> _dropDownMenuYear = [
    '1994',
    '1995',
    '1996',
    '1997',
    '1998',
    '1999',
    '2000',
    '000000'
  ];
  List<String> _dropDownMenuMonth = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];

  String? _selectedKeyYear;
  String? _selectedKeyMonth;

  bool Value = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Text('名前 [必死]'),
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
                    Text("生年月日[必須]"),
                    Row(
                      children: [
                        BuildButton(getsexValue, '男性',
                           sexvalue== '男性'? flag=true: flag=false),
                        BuildButton(getsexValue, '女性', sexvalue== '女性'? flag=true: flag=false)
                      ],
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    buildswitch(Value, size),
                    Text("生年月日[必須]"),
                    Row(
                      children: [
                        buliddrop(_selectedKeyYear, _dropDownMenuYear, '1999',
                            6, size),
                        Text('          /            '),
                        buliddrop(_selectedKeyMonth, _dropDownMenuMonth, '9', 3,
                            size),
                        Text('          /            '),
                        buliddrop(_selectedKeyMonth, _dropDownMenuMonth, '9', 3,
                            size),
                      ],
                    ),
                    buildswitch(Value, size),
                    buildProfile(),
                    BuildAboutText(),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Text("$username"),
                    Text("$sexvalue"),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      width: size.width * 0.90,
                      height: size.height * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          final isval = _formkey.currentState!.validate();

                          setState(() {
                            usernamec.text.trim();
                          });

                          if (isval) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          } else
                            return null;
                        },
                        child: Text(
                          "登録する",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // ignore: dead_code
  }

  Widget buliddrop(_value, _dropDownMenu, String hint, double dropsize, size) =>
      Container(
        height: size.height * 0.04,
        decoration: BoxDecoration(border: Border.all()),
        child: DropdownButton<String>(
          value: _value,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          iconSize: 30,
          elevation: 16,
          hint: Text(hint),

          style: TextStyle(fontSize: 20, color: Colors.black),

          // underline: Container(
          //   height: dropsize,

          //   color: Colors.grey,
          // ),

          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
          items: _dropDownMenu.map<DropdownMenuItem<String>>((String value) {
            // items: _dropDownMenu.keys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );

  Widget buildswitch(Value, size) => Row(
        children: [
          SizedBox(
            width: size.width * 0.40,
          ),
          Text("プロファイに表示しない"),
          Switch.adaptive(
              value: Value,
              activeColor: Colors.white,
              activeTrackColor: Colors.grey,
              onChanged: (Value) => setState(() {
                    this.Value = Value;
                  })),
        ],
      );
}
