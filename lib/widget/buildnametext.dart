import 'package:flutter/material.dart';

import 'package:formval/Auth/createuser.dart';
import 'package:formval/widget/builldabouttext.dart';

class BuildNameText extends StatefulWidget {
  BuildNameText(this.fn,this.name);
  Function fn;
  TextEditingController name = TextEditingController();

  @override
  _BuilNameTextState createState() => _BuilNameTextState();
}

class _BuilNameTextState extends State<BuildNameText> {
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.90,
      height: size.height * 0.07,
      child: TextFormField(
          controller: widget.name,
          decoration:
              InputDecoration(border: OutlineInputBorder(), hintText: 'クリリン'),
          keyboardType: TextInputType.name,
          validator: (Value) {
            if (Value == '') {
              return "名前を挿入して下さい";
            }
            return null;
          },
          onChanged: (value) {
            widget.fn(value);
          }),
    );
  }
}
