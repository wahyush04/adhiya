import 'package:adhiya/adhiya.dart';
import 'package:adhiya/biografi.dart';
import 'package:adhiya/profile.dart';
import 'package:adhiya/tentang.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  final tabs = [
    adhiya(),
    Biografi(),
    Profile(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(3.0),
          child: Image.asset(
          'assets/logo.png',
          // fit: BoxFit.cover,
          ),
        ),
        title: Text('adhiya'),
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.person_fill),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Baca',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Profile',
            backgroundColor: Colors.redAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Biografi',
            backgroundColor: Colors.cyan,
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}