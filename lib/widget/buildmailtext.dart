import 'package:flutter/material.dart';

class BuildMailText extends StatefulWidget {
  BuildMailText(this.fn, this.gmail);
  Function fn;
  TextEditingController gmail = TextEditingController();

  @override
  _BuildMailTextState createState() => _BuildMailTextState();
}

class _BuildMailTextState extends State<BuildMailText> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.90,
      height: size.height * 0.07,
      child: TextFormField(
        decoration: const InputDecoration(
            errorBorder: OutlineInputBorder(),
            border: OutlineInputBorder(),
            hintText: 'xxxx@xxxx.com'),
        keyboardType: TextInputType.name,
        controller: widget.gmail,
        validator: (Value) {
          if (Value=="") {
            return "メールアドレスを挿入して下さい";
          } else if (!Value!.contains('@')) {
            return "メールアドレス正しく挿入して下さい";
          }
        },
        onChanged: (value) {
          widget.fn(value);
        },
      ),
    );
  }
}
