import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Alert(),
  ));
}

class VideoApp extends StatefulWidget {
  final String videoUrl;

  const VideoApp({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 11 / 11,
              child: Stack(
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        )
                      : const Center(child: CircularProgressIndicator()),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 50,
                              color: Colors.purple[100],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tap to Play Video',
                              style: TextStyle(
                                color: Colors.purple[100],
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Alert Information',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      _buildDetailRow(
                        context,
                        label: 'Title:',
                        value:
                            ModalRoute.of(context)!.settings.arguments != null
                                ? (ModalRoute.of(context)!.settings.arguments
                                            as RemoteMessage)
                                        .data['title'] ??
                                    'Default Title'
                                : 'Default Title',
                      ),
                      _buildDetailRow(
                        context,
                        label: 'Camera:',
                        value:
                            ModalRoute.of(context)!.settings.arguments != null
                                ? (ModalRoute.of(context)!.settings.arguments
                                            as RemoteMessage)
                                        .data['subtitle'] ??
                                    'Default Subtitle'
                                : 'Default Subtitle',
                      ),
                      _buildDetailRow(
                        context,
                        label: 'Time:',
                        value:
                            '${DateTime.now().hour}:${DateTime.now().minute}',
                      ),
                      

                      SizedBox(height: 8),
                      
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 58, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Send Alert',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 73, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
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

  Widget _buildDetailRow(BuildContext context,
      {required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25), // Add space above the row
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 24,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 21,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class Alert extends StatelessWidget {
  // const Alert({Key? key, Key? key2}) : super(key: key);
  const Alert({Key? key});

  @override
  Widget build(BuildContext context) {
    FirebaseApi api = FirebaseApi();
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    final videoUrl = message.data['videoUrl'] as String;
    // final title = message.data['title'] as String;
    // final subtitle = message.data['subtitle'] as String;
    // final priority = message.data['priority'] as int;

    final id = message.data['id'] as String;
    api.markNotificationAsRead(id);

    return VideoApp(videoUrl: videoUrl);
  }
}




// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:raven_frontend/api/firebase_api.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(const Alert());
// }

// class VideoApp extends StatefulWidget {
//   final String videoUrl;

//   const VideoApp({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     // _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
//     _controller = VideoPlayerController.networkUrl(Uri.parse("https://storage.googleapis.com/raven-2e2e0.appspot.com/testy"))
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Video Demo',
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: Text('Video Preview'),
//         //   centerTitle: true,
//         // ),
//         body: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (_controller.value.isPlaying) {
//                     _controller.pause();
//                   } else {
//                     _controller.play();
//                   }
//                 });
//               },
//               child: Container(
//                 width: 300, // Adjust the width of the container
//                 height: 200, // Adjust the height of the container
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(16.0), // Border radius
//                 ),
//                 child: Stack(
//                   // Stack to overlay text over the video
//                   children: [
//                     ClipRRect(
//                       // Clip the VideoPlayer with BorderRadius
//                       borderRadius: BorderRadius.circular(16.0),
//                       child: _controller.value.isInitialized
//                           ? FittedBox(
//                               fit: BoxFit
//                                   .contain, // Maintain aspect ratio of the original video
//                               child: SizedBox(
//                                 width: _controller.value.size?.width ?? 0,
//                                 height: _controller.value.size?.height ?? 0,
//                                 child: VideoPlayer(_controller),
//                               ),
//                             )
//                           : CircularProgressIndicator(),
//                     ),
//                     Positioned(
//                       // Positioned widget to place the text at a specific position
//                       top: 5,
//                       right: 10,
//                       bottom: 0,
//                       child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.black54,
//                               borderRadius: BorderRadius.circular(
//                                   10.0), // Border radius for the container
//                             ),
//                             child: const Text(
//                               'Camera 03',
//                               style: TextStyle(
//                                 backgroundColor: Colors.purple,
//                                 color: Colors.white,
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your button action here
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors
//                           .red, // Change the background color of the button
//                     ),
//                     child: Text('Send Alert',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                       width: 16), // Adjust spacing between buttons if needed
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your button action here
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors
//                           .green, // Change the background color of the button
//                     ),
//                     child: Text(
//                       'Ignore',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

// class Alert extends StatelessWidget {
//   const Alert({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     FirebaseApi api = FirebaseApi();
//     final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

//     final videoUrl = message.data['videoUrl'] as String;

//     final title = message.data['title'] as String;

//     final subtitle = message.data['subtitle'] as String;

//     final id = message.data['id'] as String;
//     api.markNotificationAsRead(id);

//     return VideoApp(videoUrl: videoUrl);
//   }
// }


// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:raven_frontend/api/firebase_api.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(const Alert());
// }

// class VideoApp extends StatefulWidget {
//   final String videoUrl;

//   const VideoApp({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   _VideoAppState createState() => _VideoAppState();
// }

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Video Demo',
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: Text('Video Preview'),
//         //   centerTitle: true,
//         // ),
//         body: Column(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   if (_controller.value.isPlaying) {
//                     _controller.pause();
//                   } else {
//                     _controller.play();
//                   }
//                 });
//               },
//               child: Container(
//                 width: 300, // Adjust the width of the container
//                 height: 200, // Adjust the height of the container
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(16.0), // Border radius
//                 ),
//                 child: Stack(
//                   // Stack to overlay text over the video
//                   children: [
//                     ClipRRect(
//                       // Clip the VideoPlayer with BorderRadius
//                       borderRadius: BorderRadius.circular(16.0),
//                       child: _controller.value.isInitialized
//                           ? FittedBox(
//                               fit: BoxFit
//                                   .contain, // Maintain aspect ratio of the original video
//                               child: SizedBox(
//                                 width: _controller.value.size?.width ?? 0,
//                                 height: _controller.value.size?.height ?? 0,
//                                 child: VideoPlayer(_controller),
//                               ),
//                             )
//                           : CircularProgressIndicator(),
//                     ),
//                     Positioned(
//                       // Positioned widget to place the text at a specific position
//                       top: 5,
//                       right: 10,
//                       bottom: 0,
//                       child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Colors.black54,
//                               borderRadius: BorderRadius.circular(
//                                   10.0), // Border radius for the container
//                             ),
//                             child: const Text(
//                               'Camera 03',
//                               style: TextStyle(
//                                 backgroundColor: Colors.purple,
//                                 color: Colors.white,
//                                 fontSize: 12.0,
//                               ),
//                             ),
//                           )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your button action here
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors
//                           .red, // Change the background color of the button
//                     ),
//                     child: Text('Send Alert',
//                         style: TextStyle(color: Colors.white)),
//                   ),
//                   SizedBox(
//                       width: 16), // Adjust spacing between buttons if needed
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add your button action here
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors
//                           .green, // Change the background color of the button
//                     ),
//                     child: Text(
//                       'Ignore',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }

// class Alert extends StatelessWidget {
//   const Alert({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     FirebaseApi api = FirebaseApi();
//     final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

//     final videoUrl = message.data['videoUrl'] as String;

//     final id = message.data['id'] as String;
//     api.markNotificationAsRead(id);

//     return VideoApp(videoUrl: videoUrl);
//   }
// }