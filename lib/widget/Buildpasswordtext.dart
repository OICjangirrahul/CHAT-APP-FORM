
import 'package:flutter/material.dart';
import 'package:formval/widget/buildprofile.dart';

class BuildPasswordText extends StatefulWidget {
  BuildPasswordText(this.fn, this.pass);
  Function fn;
  TextEditingController pass = TextEditingController();
  @override
  _BuildPasswordTextState createState() => _BuildPasswordTextState();
}

class _BuildPasswordTextState extends State<BuildPasswordText> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      height: size.height * 0.07,
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: '*',
        controller: widget.pass,
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: 'password'),
        keyboardType: TextInputType.name,
        validator: (Value) {
          if (Value!.isEmpty) {
            return "パスワードを挿入して下さい";
          }
        },
        onChanged: (value) {
          widget.fn(value);
        },
      ),
    );
  }
}
