import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset("assets/logo.png",
                  width: 150, height: 150,),
                )
              ],
            ),
            Text('Kitab Adhiya Ullami untuk Android 1.0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Kitab Adhiya Ullami Digital adalah sebuah piranti lunak yang dapat digunakan untuk membaca kitab Adhiya Ullami yang berisi Shalawat dan Maulid Nabi.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),),
            ),
            Text('Kitab Adhiya Ullami Digital')

          ],),
      ),
    );
  }
}