import 'package:flutter/material.dart';

class BuildAboutText extends StatefulWidget {
  BuildAboutText({Key? key}) : super(key: key);

  @override
  _BuildAboutTextState createState() => _BuildAboutTextState();
}

class _BuildAboutTextState extends State<BuildAboutText> {
  final aboutc = TextEditingController();
  String? about;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.90,
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        minLines: 4,
        maxLines: 5,
        keyboardType: TextInputType.multiline,
        validator: (value) {
          if (value!.isEmpty) {
            return "自己紹介を挿入ください";
          }
        },
        onChanged: (value) => setState(() {
          about = value;
        }),
      ),
    );
  }
}
