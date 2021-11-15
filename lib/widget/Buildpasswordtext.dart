import 'package:flutter/material.dart';

class BuildPasswordText extends StatefulWidget {
  BuildPasswordText({Key? key}) : super(key: key);

  @override
  _BuildPasswordTextState createState() => _BuildPasswordTextState();
}

class _BuildPasswordTextState extends State<BuildPasswordText> {
   String password = '';
  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      height: size.height * 0.08,
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: '*',
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: 'password'),
        keyboardType: TextInputType.name,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "パスワードを挿入して下さい";
          }
        },
      ),
    );
  }
}