import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  const Tentang({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset("assets/logo.png",
                  width: 120, height: 120,),
                )
              ],
            ),
            Text('Kitab Adhiya Ullami untuk Android 1.0', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Didalam APlikasi Adhiya Ullami versi NWDI memiliki fitur seperti teks arab beserta terjemahannya. Selain itu, aplikasi ini memiliki fitur berupa suara untuk menambah daya tarik pada pengguna.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Aplikasi ini juga dilengkapi dengan bacaan sholawat dan doa, disertai biografi tentang pendiri NWDI dan pengarang kitab Adhiya Ullami.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Bacaan pada aplikasi ini memiliki 2 kategori, yaitu bacaan secara pilihan dan bacaan full.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20),),
            ),

          ],),
      ),
    );
  }
}