
import 'package:adhiya/Full.dart';
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
    Full(),
    Tentang(),
    Biografi(),

    
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
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
            icon: Icon(Icons.format_list_bulleted),
            label: 'List Bacaan',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Bacaan Full',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Tentang Aplikasi',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Biografi',
            backgroundColor: Colors.green,
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