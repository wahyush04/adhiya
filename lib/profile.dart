import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proile Developer'),
      ),
      body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/bg.jpg'
                          ),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: Container(
                      alignment: Alignment(0.0,2.5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/profile.jpg'
                        ),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                ),
                Text(
<<<<<<< HEAD
                  "S Khaliqussani Q A"
=======
                  "S KHALIQUSSANI Q A"
>>>>>>> 0fb89b933ee602ba1cc9d5c1b57075070a3e4bdf
                  ,style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "LOMBOK TIMUR, NTB"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
<<<<<<< HEAD
                  ""
=======
                  "MAHASISWA UNIVERSITAS HAMZANWADI"
>>>>>>> 0fb89b933ee602ba1cc9d5c1b57075070a3e4bdf
                  ,style: TextStyle(
                    fontSize: 15.0,
                    color:Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),

                    elevation: 2.0,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        child: Text("Skill",style: TextStyle(
                            letterSpacing: 2.0,
                            fontWeight: FontWeight.w300
                        ),))
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Dart"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        LinearProgressIndicator(
                          value: 0.2,
                        )
                      ],
                    )
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "JAVA"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            value: 0.4,
                          )
                        ],
                      )
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "PHP"
                  ,style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300
                ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            value: 0.5,
                          )
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}