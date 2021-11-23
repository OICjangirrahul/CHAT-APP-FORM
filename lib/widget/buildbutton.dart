import 'package:flutter/material.dart';
import 'package:formval/Auth/createuser.dart';

class BuildButton extends StatefulWidget {
  bool flag = true;
  Function fn;
  String? name;

  BuildButton(
    this.flag,
    this.fn,
    this.name,
  );

  @override
  _BuildButtonState createState() => _BuildButtonState();
}

class _BuildButtonState extends State<BuildButton> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        width: size.width * 0.45,
        height: size.height * 0.04,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: widget.flag ? Colors.grey : Colors.white,
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            onPressed: () {
            
              widget.fn(widget.name);
            },
            child: Text(
              "${widget.name}",
              style: TextStyle(color: Colors.black),
            )));
  }
}
