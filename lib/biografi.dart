import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Biografi extends StatelessWidget {
  const Biografi({
    Key ? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: < Widget > [
        Expanded(
          child: DefaultTabController(
            length: 2, // length of tabs
            initialIndex: 0,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: < Widget > [
              Container(
                child: TabBar(
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    Tab(text: 'Pendiri NWDI'),
                    Tab(text: 'Pengarang Kitab')
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: < Widget > [
                      Container(
                        child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(child: Text('Maulana Syaikh Tuan Guru Kyai Haji Muhammad Abdul Majid lahir di Bermi, Pancor Kecamatan Selong Kabupaten Lombok timur Provinsi Busa Tenggara Barat', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16), ), flex: 3, ),
                                            Expanded(child: Padding(
                                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                                child: Image.asset('assets/tgkh.jpeg'),
                                            ), flex: 2, )
                                          ],
                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(child: Text('TGKH. Muhammad Abdul Majid lahir pada tanggal 20 April 1908 dan meninggal 21 Oktober 1997 pada umur 89 tahun.', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16), ))
                                          ],
                                        ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(child: Text('TGKH. Muhammad Abdul Majid seorang ulama besar dari Pulau Lombok dan merupakan pendiri Nahdatul Wathan Diniyah Islamiyah (NWDI), yang merupakan organisasi besar islam di Pulau Lombok', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16), ))
                                            ],
                                          ),
                                      ),
                                    )
                                  ],
                                ),
                            ),
                      ),
                      Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(child: Text('al-Habib Umar bin Muhammad bin Salim bin Hafidz yang dilahirkan pada hari Senin, 27 Mei 1963 M. adalah seorang ulama dunia era modern. al-Habib ‘Umar kini tinggal di Tarim, Yaman di mana dia mengawasi perkembangan di Dar-al Musthafa dan berbagai sekolah lain yang telah dibangun di bawah manajemennya. ', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16), ), flex: 3, ),
                                            Expanded(child: Padding(
                                              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                                                child: Image.asset('assets/Habib_Umar.jpg'),
                                            ), flex: 2, )
                                          ],
                                        ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Expanded(child: Text('Dia masih memegang peran aktif dalam dakwah agama Islam, sedemikian aktifnya sehingga dia meluangkan hampir sepanjang tahunnya mengunjungi berbagai negara di seluruh dunia demi melakukan kegiatan-kegiatan mulianya itu.', textAlign: TextAlign.justify, style: TextStyle(fontSize: 16), ))
                                          ],
                                        ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(child: Text("Ada banyak karangan kitab al habib umar bin muhammmad bin salim bin hafizd salah satu yang terkenal di Indonesia adalah Dhiyaullami'bidzikri Maulid an-Nabi asy-Syafi atau dikenal dengan sebutan adhiya ullami. Kitab Maulid Adh-Dhiyaul Lami’ merupakan kitab yang disusun oleh Al-Hafidh Al-Musnid Al-Habib Umar bin Muhammad bin Salim bin Hafidh Maulid AdhDhiyaul lami’ ditulis pada tahun 1994 di kota Syihir, dekat Mukalla, Hadramaut, saat saya disana. Maulid Adhdhiya'ullami ini ditulis oleh Guru Mulia pada saat dini hari dan rampungnya pada saat sebelum akhir sepertiga malam terakhir", textAlign: TextAlign.justify, style: TextStyle(fontSize: 16), ))
                                            ],
                                          ),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      // Container(
                      //   child: Center(
                      //     child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      //   ),
                      // ),
                      // Container(
                      //   child: Center(
                      //     child: Text('Display Tab 4', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      //   ),
                      // ),
                    ]))
            ])
          ),
        ),
      ]),
    );
  }
}