// import 'package:adhiya/splash.dart';
import 'package:adhiya/home.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adhiya Ullami',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget{

  _SplashScreen createState() => _SplashScreen();

}

class _SplashScreen extends State<Splashscreen>{

  void initState(){
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async{
    var duration = const Duration(seconds: 3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(title: 'main',)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            Image.asset(
              "assets/logo.png", fit: BoxFit.cover,
            ),

            SizedBox(height: 24.0,),

            Text("ADHIYA ULLAMI",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,

              ),
            ),
            Text("(NWDI)",
              style: TextStyle(
                color: Colors.white,
                fontWeight:  FontWeight.bold,
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
  }


