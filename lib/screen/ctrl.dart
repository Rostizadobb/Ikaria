import 'package:flutter_qr_generator_app/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_generator_app/screen/HomeScreen.dart';

class Inicia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Inicio();
  }
}
class Inicio extends State<Inicia> {

  int bottomSelectedIndex = 1; 

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
          icon: new Icon(Icons.account_circle),
          title: Text("Yo")
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.account_balance_wallet),
        title: Text("Pagos")
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.credit_card),
          title: Text("Recarga")
      )
    ];
  }

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  Widget buildPageView() {
    MaterialPageRoute(builder: (context) => Usuario());
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      scrollDirection: Axis.horizontal,

      children: <Widget>[
        Usuario(),
        HomeScreen(),
        Red(),
      ],

    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 350), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: const Color(0xFFFF4D00),//Navbar
          
          elevation: 0.0,

        ),

      ),
      body: buildPageView(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomSelectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          bottomTapped(index);
        },
        items: buildBottomNavBarItems(),
      ),
    );
  }
}



class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("Hola :v"),

    );
  }
}



class Usuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFDDC7),//Fondo
      appBar: AppBar(
        title: Text("Cuenta de Usuario"),
        backgroundColor: const Color(0xFFFF4D00),//Navbar
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

