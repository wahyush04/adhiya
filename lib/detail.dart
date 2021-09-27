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
    await audioCache.play(DataAdhiyaList[widget.i].audio);
  }

  pauseAudio() async {
    await audioPlayer.pause();
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
        // actions: < Widget > [
        //   IconButton(onPressed: () {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       const SnackBar(content: Text('This is a snackbar')));
        //   }, icon: Icon(Icons.play_arrow_rounded))
        // ],
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: < Widget > [
                IconButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
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

            ),
        )),
    );
  }
}