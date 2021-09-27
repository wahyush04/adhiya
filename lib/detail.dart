
import 'package:adhiya/data/data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:cache_audio_player/cache_audio_player.dart';



class Detail extends StatefulWidget {
  // final DataAdhiya surah;
  int i;

  // const Detail({required this.surah, required this.indexNow});
  Detail({
    Key ? key,
    required this.i
  }): super(key: key);


  @override
  _DetailState createState() => _DetailState();

}


class _DetailState extends State < Detail > {

  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.PAUSED;
  // CacheAudioPlayer audioCache = CacheAudioPlayer();
  AudioCache audioCache = AudioCache();

  // String path = 'audio/lofi.mp3';
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
    await audioCache.play(DataAdhiyaList[widget.i].audio);
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
    Uri audioFile = await audioCache.load(DataAdhiyaList[widget.i].audio);
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
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.chevron_left)),
        title: Text("Adhiya Ullami"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: < Widget > [
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
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: DataAdhiyaList[widget.i].verses.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: ListTile(
                                    title: Text(DataAdhiyaList[widget.i].verses[index], textAlign: TextAlign.justify, textDirection: TextDirection.rtl, style: TextStyle(fontFamily: 'lpmq', fontSize: 30),),
                                    subtitle: Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                                      child: Text(DataAdhiyaList[widget.i].terjemah[index], textAlign: TextAlign.justify,),),
                                      
                                  ),
                                  );
                                },
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
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(getTimeString(timeProgress)),
                      slider(),
                      audioDuration == 0? getLocalFileDuration():Text(getTimeString(audioDuration))
                      // Expanded(flex: 1,child: Text(getTimeString(timeProgress))),
                      // Expanded(flex: 5,child: slider()),
                      // Expanded(flex: 1,child: audioDuration == 0? getLocalFileDuration():Text(getTimeString(audioDuration)))
                    ],
                  ),
              ),
              Expanded(
                flex: 2,
                child: BottomAppBar(
                color: Colors.green,
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: < Widget > [
                  IconButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      pauseAudio();
                      int index = widget.i;
                      int iback = widget.i - 1;
                      if (index == 0) {
                        return Detail(i: index);
                      } else {
                        return Detail(i: iback);
                      }
                      // return Detail(i: iback);
                    })),
                    icon: Icon(Icons.skip_previous)),
                  IconButton(
                    onPressed: () => audioPlayerState == PlayerState.PLAYING ? pauseAudio() : playAudio(),
                    icon: Icon(audioPlayerState == PlayerState.PLAYING ? Icons.pause_rounded : Icons.play_arrow_rounded)),
                  IconButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      pauseAudio();
                      int index = widget.i;
                      int inext = widget.i + 1;
                      if (index == 11) {
                        return Detail(i: index);
                      } else {
                        return Detail(i: inext);
                      }
                      // return Detail(i: iback);
                    })),
                    icon: Icon(Icons.skip_next)),

                ]
            ),),
              ),
            ],
          ),
        )
      )
    );
  }  
}





