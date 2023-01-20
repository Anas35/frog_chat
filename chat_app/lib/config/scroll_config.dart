import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollConfig extends MaterialScrollBehavior {
  
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    ...super.dragDevices,
  };

}
