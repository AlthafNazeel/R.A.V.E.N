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
  const VideoApp({super.key});

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
      debugShowCheckedModeBanner: false,
      title: 'Video Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Preview'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Container(
                width: 300, // Adjust the width of the container
                height: 200, // Adjust the height of the container
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16.0), // Border radius
                ),
                child: Stack(
                  // Stack to overlay text over the video
                  children: [
                    ClipRRect(
                      // Clip the VideoPlayer with BorderRadius
                      borderRadius: BorderRadius.circular(16.0),
                      child: _controller.value.isInitialized
                          ? FittedBox(
                              fit: BoxFit
                                  .contain, // Maintain aspect ratio of the original video
                              child: SizedBox(
                                width: _controller.value.size?.width ?? 0,
                                height: _controller.value.size?.height ?? 0,
                                child: VideoPlayer(_controller),
                              ),
                            )
                          : CircularProgressIndicator(),
                    ),
                    Positioned(
                      // Positioned widget to place the text at a specific position
                      top: 5,
                      right: 10,
                      bottom: 0,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(
                                  10.0), // Border radius for the container
                            ),
                            child: const Text(
                              'Camera 03',
                              style: TextStyle(
                                backgroundColor: Colors.purple,
                                color: Colors.white,
                                fontSize: 12.0,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your button action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .red, // Change the background color of the button
                    ),
                    child: Text('Send Alert',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(
                      width: 16), // Adjust spacing between buttons if needed
                  ElevatedButton(
                    onPressed: () {
                      // Add your button action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .green, // Change the background color of the button
                    ),
                    child: Text(
                      'Ignore',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildPlayPauseButton() {
  //   return FloatingActionButton(
  //     onPressed: () {
  //       setState(() {
  //         _controller.value.isPlaying
  //             ? _controller.pause()
  //             : _controller.play();
  //       });
  //     },
  //     child: Icon(
  //       _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
  //     ),
  //   );
  // }

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
