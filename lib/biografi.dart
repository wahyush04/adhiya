import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Biografi extends StatelessWidget {
  const Biografi({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BIOGRAFI', style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Maulana Syaikh Tuan Guru Kyai Haji Muhammad Abdul Majid lahir di Bermi, Pancor Kecamatan Selong Kabupaten Lombok timur Provinsi Busa Tenggara Barat', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),), flex: 3,),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                      child: Image.asset('assets/tgkh.jpeg'),
                    ), flex: 2,)
                  
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text('TGKH. Muhammad Abdul Majid lahir pada tanggal 20 April 1908 dan meninggal 21 Oktober 1997 pada umur 89 tahun.', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: Text('TGKH. Muhammad Abdul Majid seorang ulama besar dari Pulau Lombok dan merupakan pendiri Nahdatul Wathan Diniyah Islamiyah (NWDI), yang merupakan organisasi besar islam di Pulau Lombok', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16),))
                  ],
                ),
              )
            ],
          ),
        ),
      )
      
    );
  }
}