import 'package:flutter/material.dart';

class BuildMailText extends StatefulWidget {
  BuildMailText({Key? key}) : super(key: key);

  @override
  _BuildMailTextState createState() => _BuildMailTextState();
}

class _BuildMailTextState extends State<BuildMailText> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      height: size.height * 0.07,
      child: TextFormField(
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(),
            border: OutlineInputBorder(),
            hintText: 'xxxx@xxxx.com'),
        keyboardType: TextInputType.name,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "メールアドレスを挿入して下さい";
          } else if (!Value.contains('@')) {
            return "メールアドレス正しく挿入して下さい";
          }
        },
       
      ),
    );
  }
}
