import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  // runApp(const MaterialApp(
  //   debugShowCheckedModeBanner: false,
  //   home: Alert(),
  // ));
  runApp(const VideoApp());
}

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/raven-2e2e0.appspot.com/o/testvideo?alt=media&token=fabed883-e0cd-42aa-a73c-f17fa949954d'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}


// class Alert extends StatelessWidget {
//   const Alert({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

//     return Scaffold(
//       appBar: AppBar(title: Text("Alerts")),
//       body: Column(
//         children: [
//           Text(message.notification!.title.toString()),
//           Text(message.notification!.body.toString()),
//           Text(message.data.toString()),
//           // message.data['videoUrl'];
//         ],
//       ),
//     );
//   }
// }
