
import 'package:adhiya/data/data.dart';
import 'package:flutter/material.dart';


class Detail extends StatefulWidget {
  // final DataAdhiya surah;
  int i;
  
  // const Detail({required this.surah, required this.indexNow});
  Detail({Key? key, required this.i}) : super(key: key);


  @override
  _DetailState createState() => _DetailState();

}


class _DetailState extends State<Detail> {

  // DataAdhiya surah = DataAdhiyaList[i];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Center(
                                child: Text(
                                  DataAdhiyaList[widget.i].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text("${widget.i}"),
                              ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: DataAdhiyaList[widget.i].verses.map((text) {
                                  return Card(
                                    color: Colors.grey[50],
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            text, textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        // final DataAdhiya surah = DataAdhiyaList[index+1];
                                        int inext = widget.i + 1;
                                        return Detail(i: inext);
                                      }));
                                    },
                                    child: Icon(Icons.arrow_right),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        // final DataAdhiya surah = DataAdhiyaList[index+1];
                                        int iback = widget.i - 1;
                                        return Detail(i: iback);
                                      }));
                                    },
                                    child: Icon(Icons.arrow_left),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
              ),

            ],
          ),
        ),
      )
    );
  }
}




// class Detail extends StatelessWidget {

//   final DataAdhiya surah;
//   final DataAdhiya surahNext;
//   // final surahNext = DataAdhiyaList[3];

//   const Detail({required this.surah, required this.surahNext});
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Stack(
//             children: <Widget>[
//               SafeArea(
//                   child: Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Colors.grey,
//                                 child: IconButton(
//                                   icon: Icon(
//                                     Icons.arrow_back,
//                                     color: Colors.white,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                   },
//                                 ),
//                               ),
//                               Center(
//                                 child: Text(
//                                   surah.name,
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.teal,
//                                     fontSize: 20,
//                                   ),
//                                 ),
//                               ),
//                               ListView(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 shrinkWrap: true,
//                                 children: surah.verses.map((text) {
//                                   return Card(
//                                     color: Colors.grey[50],
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(5.0),
//                                       child: Container(
//                                         alignment: Alignment.centerRight,
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(5.0),
//                                           child: Text(
//                                             text, textAlign: TextAlign.right,
//                                             style: TextStyle(
//                                                 fontSize: 30,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 }).toList(),
//                               ),
//                               Row(
//                                 children: [
//                                   InkWell(
//                                     onTap: (){
//                                       Navigator.push(context, MaterialPageRoute(builder: (context){
//                                         // final DataAdhiya surah = DataAdhiyaList[index+1];

//                                         return Detail(surah: surahNext, surahNext: surahNext);
//                                       }));
//                                     },
//                                     child: Icon(Icons.arrow_right),
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//               ),

//             ],
//           ),
//         ),
//       )
//     );
//   }
// }