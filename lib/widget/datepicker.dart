import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datepicker extends StatefulWidget {
  
 
  Size size;
  final datefor;
  final datefor1;
  final datefor2;
  Function fn;

  Datepicker(this.size, this.datefor, this.datefor1,
      this.datefor2, this.fn);

  @override
  _DatepickerState createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
   DateTime? date;
  // DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            alignment: Alignment.center,
            height: widget.size.height / 25,
            width: widget.size.width / 5,
            child: Text(date==null ? '年齢'   :widget.datefor.format(date))),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            alignment: Alignment.center,
            height: widget.size.height / 25,
            width: widget.size.width / 9,
            child: Text(date==null ? '月'   :widget.datefor1.format(date))),
        Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            alignment: Alignment.center,
            height: widget.size.height / 25,
            width: widget.size.width / 9,
            child: Text(date==null ? '日'   :widget.datefor2.format(date))),
        Container(
          height: widget.size.height * 0.04,
          decoration: BoxDecoration(border: Border.all()),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
            child: Text(
              '選択',
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              showDatePicker(
                
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2022))
                  .then((value) => setState(() {
                     date = value as DateTime;
                    date==null ? null :   widget.fn(value);
                      }));
            },
          ),
        ),
      ],
    );
   
  }
}
