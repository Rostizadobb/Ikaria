import 'package:flutter/material.dart';
import 'package:flutter_qr_generator_app/screen/login.dart';
import 'package:qr_utils/qr_utils.dart';
import './OtherPage.dart';
import './OtherPageTwo.dart';

import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

String mainProfilePicture = "https://i.imgur.com/BoN9kdC.png";
String otherProfilePicture = "https://i.ytimg.com/vi/HcGYElbP5BQ/maxresdefault.jpg";

  void switchUser() {
    String picBackup = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = picBackup;
    });

  }

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
      appBar: AppBar(elevation: 0.1, title: Text('Ikaria QR Code'), backgroundColor: const Color(0xFFFF4D00),),
      drawer: new Drawer( //Vertical menu
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("CeeJee"),
              accountEmail: new Text("CeeJee@gta.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("Usuario Actual: CJ \n Contraseña: ****** "),
                child: new CircleAvatar(
                  backgroundImage: new NetworkImage(mainProfilePicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => switchUser(),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(otherProfilePicture),
                  ),
                )
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage("https://img00.deviantart.net/35f0/i/2015/018/2/6/low_poly_landscape__the_river_cut_by_bv_designs-d8eib00.jpg")
                )
              ),
            ),
            new ListTile(
              title: new Text("Info de la Cuenta" ),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage("Info Personal")));
              },
            ),
            new ListTile(
                title: new Text("Recarga" ),
                trailing: new Icon(Icons.arrow_right),
                onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPageTwo("Recargar")));
              },
              ),
              new Divider(),
              new ListTile(
                title: new Text("Logout" ),
                trailing: new Icon(Icons.cancel),
                onTap: () {
                   Navigator.of(context).pop();
                   Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LogIn()));
                }
            )

          ],
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
                
                child: Text("\n \n                Su saldo es de: \n                 120.00 pesos ", style: TextStyle (fontSize: 25.0, )),
               
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
