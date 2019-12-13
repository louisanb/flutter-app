import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:provider/provider.dart';


import '../providers/products.dart';
import '../widgets/appearance/button.dart';
import '../widgets/appearance/text.dart';
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
  // String _prvTime;

  @override
  void initState() {
    super.initState();
      _date = widget.fmd;
      _time = widget.fmt;
      // _prvTime = widget.fmt;
  }

  @override
  Widget build(BuildContext context) {
    // final updateT = Provider.of<Products>(context, listen: false);
    final updateT = Provider.of<Products>(context);
    // print("555555555555 updateTime ll be called in time picker af build");
    //weird this is called when at order detail pg and the print line abv is not called bur in edit pg is not called 
    //also only line abv is called in time picker w cuz i was fucking change the time instead of the date so i was 
    //changing the wrong thing
    // if (_prvTime != _time) {
    //   print("555555555555 updateTime ll be called in time picker af build in if");
    //   updateT.updateTime('$_time');
    // }
    return 
    // Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: 
        // Container(child: 
      Column( children: <Widget>[
          Row(
            // mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoText(
                  params: Params()
                      ..text = "Scheduled Time:"
                      ..textHeight = 26.0
                      ..textWidth = 125.0//57
                      ..textColor = ColorRes.greyBtnTxtColor
                      ..letterSpacing = 1.0
                      ..fontSize = 16.0
                      ..fontFamily = "Roboto-Medium"
                      ..marginTop = 13.0//84, 5
                      ..marginLeft = 13.0//21
                ),
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
                      // DatePicker.showDatePicker(context,
                      //     theme: DatePickerTheme(
                      //       containerHeight: 210.0,
                      //     ),
                      //     showTitleActions: true,
                      //     minTime: DateTime(2000, 1, 1),
                      //     maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                      //       print('confirm $date');
                      //       _date = '${date.year} - ${date.month} - ${date.day}';
                      //       setState(() {});
                      //     }, 
                      //     currentTime: DateTime.now(), locale: LocaleType.en
                      // );
                    }
                ),
                  // RegButton(
                  //     params: Params()
                  //       ..text = "Change"
                  //       ..textHeight = 26.0
                  //       ..fontFamily = "Roboto-Medium"
                  //       //  "Roboto-Light" : "Roboto"
                  //       ..fontSize = 20.0
                  //       ..letterSpacing = 2.14
                  //       ..textColor = ColorRes.colorWhite
                  //       ..height = 29.0
                  //       ..width = 42.0
                  //       ..backgroundColor = ColorRes.greyBtnChatColor
                  //       // ..alignment = Alignment.center
                  //       ..marginLeft = 0.0
                  //       ..marginTop = 13.0,
                  //     tap: () {
                  //         DatePicker.showDatePicker(context,
                  //           theme: DatePickerTheme(
                  //             containerHeight: 210.0,
                  //           ),
                  //           showTitleActions: true,
                  //           minTime: DateTime(2000, 1, 1),
                  //           maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                  //             print('confirm $date');
                  //             _date = '${date.year} - ${date.month} - ${date.day}';
                  //             setState(() {});
                  //           }, 
                  //           currentTime: DateTime.now(), locale: LocaleType.en
                  //         );
                  //     }
                  // ),  
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
                        ..marginLeft = 13.0 
                        ..marginTop = 13.0,//2 23 
                      tap: () {
                          // DatePicker.showTimePicker(context,
                          //   theme: DatePickerTheme(
                          //     containerHeight: 210.0,
                          //   ),
                          //   showTitleActions: true, onConfirm: (time) {
                          //     print('confirm $time');
                          //     _time = '${time.hour} : ${time.minute}';
                          //     setState(() {});
                          //   }, 
                          //   currentTime: DateTime.now(), locale: LocaleType.en
                          // );
                          //   setState(() {});
                      }
                  ),
                  // RegButton(
                  //     params: Params()
                  //       ..text = "Change"
                  //       ..textHeight = 26.0
                  //       ..fontFamily = "Roboto-Medium"
                  //       //  "Roboto-Light" : "Roboto"
                  //       ..fontSize = 20.0
                  //       ..letterSpacing = 2.14
                  //       ..textColor = ColorRes.colorWhite
                  //       ..height = 29.0
                  //       ..width = 42.0
                  //       ..backgroundColor = ColorRes.greyBtnChatColor
                  //       // ..alignment = Alignment.center
                  //       ..marginLeft = 0.0
                  //       ..marginTop = 13.0,
                  //     tap: () {
                  //       DatePicker.showTimePicker(context,
                  //           theme: DatePickerTheme(
                  //             containerHeight: 210.0,
                  //           ),
                  //           showTitleActions: true, onConfirm: (time) {
                  //             print('confirm $time');
                  //             _time = '${time.hour} : ${time.minute}';
                  //             setState(() {});
                  //           }, currentTime: DateTime.now(), locale: LocaleType.en
                  //       );
                  //           setState(() {});
                  //     }
                  // ),
                ]),
          //tt the 2 reg butt below, there must a way to shorten it since there s some repeating blocks/code
          //ttf in the future need to use alibaba go app's date pick widget so when u select date u can see what day it is in the week(ex: Monday) 
          //ttf should get ride of the sec section at picking the time. 
          Row(children: <Widget>[
              RegButton(
                  params: Params()
                    ..text = "Change"
                    ..textHeight = 26.0
                    ..fontFamily = "Roboto-Medium"
                    //  "Roboto-Light" : "Roboto"
                    ..fontSize = 20.0
                    ..letterSpacing = 2.14
                    ..textColor = ColorRes.colorWhite
                    ..height = 29.0
                    ..width = 100.0
                    ..backgroundColor = ColorRes.greyBtnChatColor
                    // ..textAlig = Alignment.center
                    ..marginLeft = 135.0//70 70-57=13
                    ..marginTop = 13.0,
                  tap: () {
                      DatePicker.showDatePicker(context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(2000, 1, 1),
                        maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          print("555555555555 updateTime ll be called in time picker af confirm in date");
                          // date.substring(0, 5)
                          // updateT.updateTime('$date', '$_time', 'date');
                          _date = '${date.year} - ${date.month} - ${date.day}';
                          updateT.updateTime('$date', '$_time', 'date');
                          print("222222222222 _time in date of TimePicker: $_time");
                          print('222222222222 date in date of TimePicker: $date"');
                          setState(() {
                            // _date = date.toString().substring(0, 11);
                            // _time = _time;
                          });
                        }, 
                        currentTime: DateTime.now(), locale: LocaleType.en
                      );//date picker
                  }//tap
              ),
              RegButton(
                  params: Params()
                    ..text = "Change"
                    ..textHeight = 26.0
                    ..fontFamily = "Roboto-Medium"
                    //  "Roboto-Light" : "Roboto"
                    ..fontSize = 20.0
                    ..letterSpacing = 2.14
                    ..textColor = ColorRes.colorWhite
                    ..height = 29.0
                    ..width = 100.0
                    ..backgroundColor = ColorRes.greyBtnChatColor
                    // ..textAlig = Alignment.center
                    ..marginLeft = 13.0
                    ..marginTop = 13.0,
                  tap: () {
                      DatePicker.showTimePicker(context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true, onConfirm: (time) {
                          print("555555555555 print test bef confirm time");
                          print('confirm $time');
                          print("555555555555 print test af confirm time");
                          print("555555555555 updateTime ll be called in time picker af confirm");
                          // final String upT = time.toStirng.substring(0, 11);
                          // updateT.updateTime('$_date', '$time', 'time');
                          _time = '${time.hour} : ${time.minute}';
                          updateT.updateTime('$_date', '$time', 'time');
                          print("222222222222 time in time of TimePicker: $time");
                          print('222222222222 _date in time of TimePicker: $_date"');
                          // print("555555555555 updateTime ll be called in time picker af _time=time.hour");
                          // updateT.updateTime('$_time');
                          setState(() {
                            // print("555555555555 updateTime ll be called in time picker set state deep");
                            // // updateT.updateTime('$time');
                            // updateT.updateTime('$_time');
                            // print("555555555555 prvTime is set in time picker set state");
                            // _prvTime = _time;
                            // _date = _date;
                            // _time = time.toString().substring(10, 19);
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.en,
                        // cant put print or update time here nothing s allowed af line abv
                      );//data picker
                      setState(() {
                        // print("555555555555 prvTime is set in time picker set state");
                        // _prvTime = _time;
                        // print("555555555555 updateTime ll be called in time picker set state");
                        // updateT.updateTime('$_time');
                      });
                      // print("555555555555 updateTime ll be called in time picker outside time picker but in tap");
                      // updateT.updateTime('$_time');
                    }//tap
              ),  
          ],)     
      ]);
            
  }
}