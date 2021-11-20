import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datepicker extends StatefulWidget {
  DateTime date;
  Size size;
  final datefor;
  final datefor1;
  final datefor2;

  Datepicker(this.date,this.size,this.datefor,this.datefor1,this.datefor2);

  @override
  _DatepickerState createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  // DateTime date = DateTime.now();
  

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          alignment: Alignment.center,
            
            height: widget.size.height /25,
            width: widget.size.width /5,
            child: Text(widget.datefor.format(widget.date))),
            Container(
              decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
         
          alignment: Alignment.center,
            
            height: widget.size.height /25,
            width: widget.size.width /9,
            child: Text(widget.datefor1.format(widget.date))),
            Container(
         decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          alignment: Alignment.center,
       
            height: widget.size.height /25,
            width: widget.size.width /9,
            child: Text(widget.datefor2.format(widget.date))),
       
       
        Container(
           height: widget.size.height * 0.04,
           decoration: BoxDecoration(border: Border.all()),
          child: ElevatedButton(
            
            style: ElevatedButton.styleFrom(primary: Colors.white,
            
            ),

            child: Text('誕生日',style: TextStyle(color: Colors.black),),
            onPressed: () {
              showDatePicker(
                
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2022))
                  .then((value) => setState(() {
                        widget.date = value as DateTime;
                      }));
            },
          ),
        ),
      ],
    );
    // Scaffold(
    //   body: Column(
    //     children: [
    //       ElevatedButton(
    //         child: Text('date'),
    //         onPressed: () {
    //           showDatePicker(
    //                   context: context,
    //                   initialDate: DateTime.now(),
    //                   firstDate: DateTime(2000),
    //                   lastDate: DateTime(2022))
    //               .then((value) => setState(() {
    //                     date = value as DateTime;
    //                   }));
    //         },
    //       ),
    //       Text(datefor.format(date)),
    //        Text(datefor1.format(date))
    //     ],
    //   ),
    // );
  }
}
