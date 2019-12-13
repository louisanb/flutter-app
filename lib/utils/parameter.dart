import 'package:flutter/material.dart';

class Params {
  //容器通用相关属性
  double width;
  double height;
  double padding;
  double margin;
  double marginTop;
  double marginBot;
  double marginLeft;
  // double marginRigt;
  int backgroundColor;

  // Text 相关属性
  String text;
  double fontSize;
  String fontFamily;
  int textColor;//
  double letterSpacing;
  var fontWeight;
  
  // Text 容器相关属性
  double textHeight;
  double textWidth;

  // InputField 相关属性
  bool autoFocus = false;
  String hintText;

  // 点击事件 //this should be f i think
  var tap;

 //ttx the real type of these var need to be verified/specified
  // var controller;
  // Widget alignment;
  // Widget textAlig;
  dynamic controller;
  dynamic alignment;
  dynamic textAlig;
  
  Widget icon;
  IconData icon3;
  double size;
  Color lgS;
  Color lgE;
  String img;
  
  int iconColor;//can use textColor to replace this
  int ftrBg;

  Icon icon2;
  int bgColor;
  
  //use it to switch psw and confirm psw widget in input.dart
  // bool cp;
  //dnw but can try provider or maybe try using the same way as passing controller in but pass authData instead or just def a map then pass in authData 
  // Map<String, String> authDataEmail = {
  //   'email': '',
  //   'password': '',
  // };
  // Map<String, String> authData
  // ; //err []={email: louisan7xxxxx} null
  // = {
  //   'email': '',
  //   'password': '',
  // };
  // Map<String, String> get authData {
  //   return authData;
  // }
}