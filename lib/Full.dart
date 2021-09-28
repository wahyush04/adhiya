import 'package:flutter/material.dart';
import 'package:adhiya/data/data.dart';
import 'package:audioplayers/audioplayers.dart';


class Full extends StatefulWidget {
  const Full({
    Key ? key
  }): super(key: key);

  @override
  _FullState createState() => _FullState();
}

class _FullState extends State < Full > {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  // CacheAudioPlayer audioCache = CacheAudioPlayer();
  AudioCache audioCache = AudioCache();

  String path = 'audio/full_bacaan.mp3';
  int timeProgress = 0;
  int audioDuration = 0;

  Widget slider(){
    return Slider.adaptive(
        value: (timeProgress / 1000).floorToDouble(),
        max: ((audioDuration / 1000.floorToDouble())), 
        activeColor: Colors.blue,
        inactiveColor: Colors.blueGrey,
        onChanged: (value){
          seekToSec(value.toInt());
        });
  }

  @override
  void initState() {
    super.initState();

    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      setState(() {
        timeProgress = p.inMilliseconds;
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

  void seekToSec(int sec) {
    Duration newPosition = Duration(seconds: sec);
    audioPlayer.seek(newPosition);
  }

  // Widget getFileAudioDuration(){
  //   return FutureBuilder(future: _getAudioDuration(), builder: (BuildContext context, Asy),);
  // }

  Future<int> _getAudioDuration() async {
    Uri audioFile = await audioCache.load(path);
    await audioPlayer.setUrl(
      audioFile.path,
    );

    audioDuration = await Future.delayed(
      Duration(seconds: 2),
      () => audioPlayer.getDuration(),
    );

    return audioDuration;
  }


  Widget getLocalFileDuration() {
    return FutureBuilder(
      future: _getAudioDuration(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('No Connection...');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Text('Waiting...');
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Text(getTimeString(snapshot.data));
        }

          // if (snapshot.connectionState == ConnectionState.done){
          //   return Text(getTimeString(snapshot.data));
          // }
          // return Text('');
      },
    );
  }

  String getTimeString(int milliseconds) {
    if (milliseconds == null) milliseconds = 0;
    String minutes =
        '${(milliseconds / 60000).floor() < 10 ? 0 : ''}${(milliseconds / 60000).floor()}';
    String seconds =
        '${(milliseconds / 1000).floor() % 60 < 10 ? 0 : ''}${(milliseconds / 1000).floor() % 60}';
    return '$minutes:$seconds'; // Returns a string with the format mm:ss
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
    ),
    floatingActionButton: FloatingActionButton(
        onPressed: () => audioPlayerState == PlayerState.PLAYING ? pauseAudio() : playAudio(),
        child: Icon(audioPlayerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded),
        backgroundColor: Colors.green,
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