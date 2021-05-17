import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:vierra/screens/homescreen.dart';
import 'package:wakelock/wakelock.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool loop;
  Video({@required this.videoPlayerController,this.loop,Key key}) :super(key: key);
  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.loop,
      aspectRatio: 16/9,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Wakelock.enable();
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose(){
    Wakelock.disable();
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

class Videoplayer extends StatefulWidget {
  final String videoData;
  Videoplayer({this.videoData});
  @override
  _VideoplayerState createState() => _VideoplayerState();

}

class _VideoplayerState extends State<Videoplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.yellowAccent[700],),
          onPressed: (){
            Navigator.pushReplacement(
              context,MaterialPageRoute(builder: (context) => HomeScreen())
            );
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Video(
            loop: true,
            videoPlayerController: VideoPlayerController.network(widget.videoData),
          ),
        ),
      ),
    );
  }
}



