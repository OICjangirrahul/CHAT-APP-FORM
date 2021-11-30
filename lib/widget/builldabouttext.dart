import 'package:flutter/material.dart';
import 'package:formval/Auth/createuser.dart';

class BuildAboutText extends StatefulWidget {
  BuildAboutText(this.fn, this.about);

  Function fn;
  TextEditingController about = TextEditingController();

  @override
  _BuildAboutTextState createState() => _BuildAboutTextState();
}

class _BuildAboutTextState extends State<BuildAboutText> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: size.width * 0.90,
          child: TextFormField(
              controller: widget.about,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              minLines: 2,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              validator: (value) {
                if (value!.isEmpty) {
                  return "自己紹介を挿入ください";
                }
              },
              onChanged: (value) {
                widget.fn(value);
              }),
        ),
      ],
    );
  }
}
