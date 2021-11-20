import 'package:flutter/material.dart';

class MainButton extends StatefulWidget {
  Size size;
  Function fn;
  String text;
  MainButton(this.size, this.fn,this.text);

  @override
  _MainButtonState createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
        Container(
          
            decoration: BoxDecoration(border: Border.all()),
            width: widget.size.width * 0.90,
            height: widget.size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                widget.fn();
              },
              child: Text(
                widget.text,
                style: TextStyle(color: Colors.black),
              ),
            )),
      ],
    );
  }
}
