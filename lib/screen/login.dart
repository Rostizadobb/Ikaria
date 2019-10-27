import 'package:flutter/material.dart';
import 'package:flutter_qr_generator_app/screen/HomeScreen.dart';
//import 'package:flutter_qr_generator_app/screen/HomeScreen.dart';
//import 'package:flutter_qr_generator_app/screen/card.dart';
import 'package:flutter_qr_generator_app/screen/ctrl.dart';

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LogInState();
  }
}
class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFDFDDC7),//Fondo
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF4D00),//Navbar
          title: Text('Bienvenido a Ikaria'),
        ),
        body: Center(
            child: Container(
                margin: const EdgeInsets.all(10.0),
                padding: EdgeInsets.only(top: 310),
                color: Colors.white,
                width: 300.0,
                height: 350.0,
                child: Container(
                  //margin: const EdgeInsets.only(top: 30.0),
                  child: FlatButton(
                    color: Colors.deepPurple[900],
                    
                    //padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                    child:Text(': :            Sign in with Blockstack'),
                    textColor: Colors.white,
                    
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                )
              ),
        )
      ),
    );
  }  
}

//MaterialPageRoute(builder: (context) => HomeScreen()),