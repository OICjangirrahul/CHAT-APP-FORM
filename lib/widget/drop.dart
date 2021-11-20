import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildDrop extends StatefulWidget {
  List<String> itemslist = [];
  String? dropdownValue;
  Function fn;
  final size;
  String? text;
  
  BuildDrop(
    this.itemslist,
    this.dropdownValue,
    this.fn,
    this.size,
    this.text,
 
  );
  @override
  _BuildDropState createState() => _BuildDropState();
}

class _BuildDropState extends State<BuildDrop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2),
        height: widget.size.height * 0.04,
        
        
        decoration: BoxDecoration(border: Border.all()),
        child: DropdownButton<String>(
          value: widget.dropdownValue,
          hint: Text('${widget.text}'),
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {
            setState(() {
              // widget.dropdownValue = newValue!;
              widget.fn(newValue);
            });
          },
          items: widget.itemslist.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
