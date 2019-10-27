import 'package:flutter/material.dart';
import 'package:qr_utils/qr_utils.dart';

import 'package:flutter/services.dart';
import 'package:flutter_qr_generator_app/screen/ctrl.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Image _image;
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _controller = new TextEditingController();

  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFDFDDC7),//Fondo
      appBar: AppBar(
        elevation: 0.1, // Check Platform if android
        title: Text(''),
        backgroundColor: const Color(0xFFFF4D00),//Navbar
        flexibleSpace: FlexibleSpaceBar(
            title: Align(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: CircleAvatar(
                    backgroundImage: NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                    radius: 35.0,
                    child: InkWell(
                      onTap:(){
                        Usuario();
                      },
                    ),
                    ),
              
                  )
                ],
              ), 
            ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                
                
                padding: EdgeInsets.symmetric(vertical: 10),
                height: 220.0,
                width: 220.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(16.0),
                    
                    
                  ),
                  
                  
                ),
                child: Center(
                  
                  child: _image != null ? _buildGeneratedQR() : _generateQR("e18e3c72addd03c14d8f9cc9279cf14282d514c8ca1f9cf1563e4241b3251e30"),
                  
                ),
                
              ),
              
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                child: Container(
                  
                  
                  child: Text("Usuario",
                  style: TextStyle(fontWeight: FontWeight.bold),),
                  
                ),
               
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneratedQR() {
    return Container(
      
      width: 400.0,
      height: 400.0,
      child: _image,
    );
  }
  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

   _generateQR(String content) async {
    Image image;
    if (_image==null){
        try {
          image = await QrUtils.generateQR(content);
        } on PlatformException {
          image = null;
        }
    }
    
    setState(() {
      _image = image;
    });
  }
}
