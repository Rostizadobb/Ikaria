import 'package:flutter/material.dart';
import 'package:flutter_qr_generator_app/constant/Constant.dart';
import 'package:flutter_qr_generator_app/screen/login.dart';

void main() => runApp(
  
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      
      primarySwatch: Colors.greenAccent[800],
    ),
    title: 'QR GENERATOR',
    routes: <String, WidgetBuilder>{
      HOME_SCREEN: (BuildContext context) => LogIn(),
    },
    home: LogIn(),
    //home: HomeScreen(),
  ),
);
