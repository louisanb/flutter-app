import 'dart:ui';
import 'dart:io';

import 'package:flutter/material.dart';

class SpUtil {
  
  // 当前设备与设计图的尺寸比
  static double density, pDensity, respvRH, 
  respvRW
  // , 
  // respvRh, respvRw, dHeight, dWidth, 
  // respvR
  ;
  // static double pDensity;

  static void init() {
    // 实际屏幕宽高
    double rotio =window.devicePixelRatio;
    double mWidth = window.physicalSize.width / rotio;
    double mHeight =window.physicalSize.height / rotio;

    // 设计图宽高
    double defWidth, defHeight;
    if (Platform.isIOS) {
      defWidth = 375.0;
      defHeight = 667.0;
    }else if (Platform.isAndroid) {
      defWidth = 360.0;
      defHeight = 740.0;
    }
    print("rotio: $rotio");
    print("mWidth: $mWidth");
    print("mHeight: $mHeight");
    print("defWidth: $defWidth");
    print("density: $density");

    //如果实际宽高比大于设计图宽高比，就根据高度比例适配；反之，根据宽度比例适配
    density = mWidth / mHeight > defWidth / defHeight ? mHeight / defHeight :mWidth / defWidth;
    print("density: $density");

    double pWidth = window.physicalSize.width;
    double pHeight = window.physicalSize.height;
    //640 design height or height of the phone the design was based of 
    //360 width....detto......
    double dHeight = 640.0;
    double dWidth = 360.0;
    double respvR = dHeight/dWidth;//unecessary see below commoent out if sttm. nvm it s atucally necessary lol 
    double respvRh = pHeight/dHeight;//u can also use/(replace with) _respvRh or _respvRH
    double respvRw = pWidth/dWidth;
    // respvRH = pHeight/640.0;
    // respvRW = pWidth/360.0;
    // if (pHeight/pWidth == 640.0/360.0){
    //   // respvRh = respvRH;
    //   // respvRw = respvRW;
    //   respvRH = respvRH;
    //   respvRW = respvRW;
    // }else{}
    //ther s diff to init dWidth dheight respvRh etc here our outside i think outside s better cuz it ll be init once with 
    //static but maybe they r the same cuz "static void init() {" did the same thing. actually i think inside s better
    if (pHeight/pWidth == respvR){//unecessary cuz it made it not clear. lol nvm
    // if (pHeight/pWidth == dHeight/dWidth){ //or pHeight/dHeight == pWidth/dWidth
      // respvRh = respvRH;
      // respvRw = respvRW;
      respvRH = respvR;
      respvRW = respvR;
    }else{
      respvRH = respvRh;
      respvRW = respvRw;
    }

  }

  static double getSize(double val) {
    // print("density: $density");
    // print("val: $val");
    // print("rotio: $rotio");
    return density * val;
  }
}