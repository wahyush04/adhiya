import 'package:flutter/material.dart';
import 'package:adhiya/data/data.dart';


class Full extends StatefulWidget {
  const Full({
    Key ? key
  }): super(key: key);

  @override
  _FullState createState() => _FullState();
}

class _FullState extends State < Full > {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Stack(
          children: < Widget > [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: DataAdhiyaList.length,
                      itemBuilder: (BuildContext context, int blockIdx) {
                        return new Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  top: BorderSide(width: 3.0, color: Colors.grey),
                                  bottom: BorderSide(width: 3.0, color: Colors.grey),
                                )
                              ),
                              child: Padding(
                                child: Center(
                                  child: Text(
                                    DataAdhiyaList[blockIdx].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.all(15.0)
                              ),
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: DataAdhiyaList[blockIdx].verses.length,
                                itemBuilder: (BuildContext context, int childIdx) {
                                  return Padding(
                                    child: Card(
                                      child: ListTile(
                                        title: Text(DataAdhiyaList[blockIdx].verses[childIdx], textAlign: TextAlign.justify, textDirection: TextDirection.rtl, style: TextStyle(fontFamily: 'lpmq', fontSize: 30), ),
                                        subtitle: Padding(
                                          padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                          child: Text(DataAdhiyaList[blockIdx].terjemah[childIdx], textAlign: TextAlign.justify, ), ),

                                      ),
                                    ),
                                    padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
                                  );
                                },
                            ),
                          ],
                        );
                      },
                  ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

// Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Container(
//                                 decoration: BoxDecoration(
//                                 border: Border(top: BorderSide(color: Colors.grey, width: 0.5), bottom: BorderSide(color: Colors.grey, width: 0.5))
//                                 ),
//                                 child: Center(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                       DataAdhiyaList[0].name,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.teal,
//                                         fontSize: 20,
//                                       ),
//                                     ),

//                                   )
//                                 ),
//                               ),
//                               ListView.builder(
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 shrinkWrap: true,
//                                 itemCount: DataAdhiyaList[0].verses.length,
//                                 itemBuilder: (context, index) {
//                                   return Card(
//                                     child: ListTile(
//                                     title: Text(DataAdhiyaList[0].verses[index], textAlign: TextAlign.justify, textDirection: TextDirection.rtl, style: TextStyle(fontFamily: 'lpmq', fontSize: 30),),
//                                     subtitle: Padding(
//                                       padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
//                                       child: Text(DataAdhiyaList[0].terjemah[index], textAlign: TextAlign.justify,),),

//                                   ),
//                                   );
//                                 },
//                               ),
//                             ],
//                           ),