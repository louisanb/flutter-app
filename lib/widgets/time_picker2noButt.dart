import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../widgets/appearance/button.dart';
import '../utils/parameter.dart';
import '../res/colors.dart';

class TimePicker extends StatefulWidget {
  final String fmd, fmt;

  TimePicker(this.fmd, this.fmt);

  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  // final String fmd, fmt;

  // _TimePicker(this.fmd, this.fmt);
 
  String _date ;
  String _time ;

  @override
  void initState() {
    super.initState();
      _date = widget.fmd;
      _time = widget.fmt;
  }

  @override
  Widget build(BuildContext context) {
    return 
    // Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: 
        // Container(child: 
          Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // RaisedButton(
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5.0)),
              //   elevation: 4.0,
              //   onPressed: () {
                TextButton(
                      params: Params()
                        ..text = "$_date"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 29.0
                        ..textWidth = 100.0
                        ..letterSpacing = 1.0
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 16.0
                        ..textColor = ColorRes.titleTextColor
                        ..marginLeft = 0.0 
                        ..marginTop = 13.0,//2 23 
                      tap: () {
                          DatePicker.showDatePicker(context,
                              theme: DatePickerTheme(
                                containerHeight: 210.0,
                              ),
                              showTitleActions: true,
                              minTime: DateTime(2000, 1, 1),
                              maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                            print('confirm $date');
                            _date = '${date.year} - ${date.month} - ${date.day}';
                            setState(() {});
                          }, currentTime: DateTime.now(), locale: LocaleType.en);
                      }
                  ),  
                  TextButton(
                      params: Params()
                        ..text = "$_time"
                        ..bgColor = ColorRes.colorWhite
                        ..textHeight = 29.0
                        ..textWidth = 100.0
                        ..letterSpacing = 1.0
                        ..fontFamily = "Roboto-Medium"
                        ..fontSize = 16.0
                        ..textColor = ColorRes.titleTextColor
                        ..marginLeft = 50.0 
                        ..marginTop = 13.0,//2 23 
                      tap: () {
                          DatePicker.showTimePicker(context,
                            theme: DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true, onConfirm: (time) {
                          print('confirm $time');
                          _time = '${time.hour} : ${time.minute}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                        setState(() {});
                      }
                  ),
                ]
               
                );

  }
}