
import 'package:adhiya/data/data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cache_audio_player/cache_audio_player.dart';



class Detail extends StatefulWidget {
  // final DataAdhiya surah;
  int i;
  
  // const Detail({required this.surah, required this.indexNow});
  Detail({Key? key, required this.i}) : super(key: key);


  @override
  _DetailState createState() => _DetailState();

}


class _DetailState extends State<Detail> {

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  // CacheAudioPlayer audioCache = CacheAudioPlayer();
  AudioCache audioCache = AudioCache();

  String path = 'audio/lofi.mp3';

  @override
  void initState() {
    super.initState();
    
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearAll();

  }

  playAudio() async {
    await audioCache.play(path);
  }

  pauseAudio() async {
    await audioPlayer.pause();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.chevron_left)),
          title: Text("${DataAdhiyaList[widget.i].name}"),
          actions: <Widget>[
            IconButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            }, icon: Icon(Icons.play_arrow_rounded))
          ],
      ),
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            text + "۞", textAlign: TextAlign.justify, textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              fontFamily: 'lpmq',
                                              fontWeight: FontWeight.normal,
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
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                        // final DataAdhiya surah = DataAdhiyaList[index+1];
                                        int iback = widget.i - 1;
                                        return Detail(i: iback);
                                      }));
                                    },
                                    child: Icon(Icons.arrow_left),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                        // final DataAdhiya surah = DataAdhiyaList[index+1];
                                        int inext = widget.i + 1;
                                        return Detail(i: inext);
                                      }));
                                    },
                                    child: Icon(Icons.arrow_right),
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
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.skip_previous),
              IconButton(
                onPressed: () => audioPlayerState == PlayerState.PLAYING ? pauseAudio() : playAudio(),
                icon: Icon(audioPlayerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded)),
              Icon(Icons.skip_next)
            ]
            
          ),
        )),
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