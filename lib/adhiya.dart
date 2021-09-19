import 'dart:convert';

import 'package:adhiya/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/data.dart';
import 'detail.dart';


class adhiya extends StatefulWidget {
  const adhiya({ Key? key }) : super(key: key);

  @override
  _adhiyaState createState() => _adhiyaState();
}

Future<String> _loadData() async {
  return await rootBundle.loadString('assets/list.json');
}

class _adhiyaState extends State<adhiya> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final DataAdhiya surah = DataAdhiyaList[index];
          // int indexNow = index;      
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Detail(i: index)
              )
              );
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            surah.name,textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 20.0, fontFamily: 'TimesNewArabic'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: DataAdhiyaList.length,
      ),
    );
  }
}