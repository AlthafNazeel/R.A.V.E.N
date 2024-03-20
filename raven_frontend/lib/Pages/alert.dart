import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:raven_frontend/api/firebase_api.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
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
                      : Center(child: CircularProgressIndicator()),
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
                            SizedBox(height: 8),
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
            SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alert Information',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 18),
                      _buildDetailRow(
                        context,
                        label: 'Title:',
                        value: ModalRoute.of(context)!.settings.arguments != null
                            ? (ModalRoute.of(context)!.settings.arguments as RemoteMessage).data['title'] ?? 'Default Title'
                            : 'Default Title',
                      ),
                      _buildDetailRow(
                        context,
                        label: 'Camera:',
                        value: ModalRoute.of(context)!.settings.arguments != null
                            ? (ModalRoute.of(context)!.settings.arguments as RemoteMessage).data['subtitle'] ?? 'Default Subtitle'
                            : 'Default Subtitle',
                      ),
                      _buildDetailRow(
                        context,
                        label: 'Time:',
                        value: '${DateTime.now().hour}:${DateTime.now().minute}',
                      ),

                      SizedBox(height: 8),
                      
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 58, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Send Alert',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 73, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
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

  Widget _buildDetailRow(BuildContext context, {required String label, required String value}) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 25), // Add space above the row
      Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
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
  const Alert({Key? key});

  @override
  Widget build(BuildContext context) {
    FirebaseApi api = FirebaseApi();
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    final videoUrl = message.data['videoUrl'] as String;
    final title = message.data['title'] as String;
    final subtitle = message.data['subtitle'] as String;
    // final priority = message.data['priority'] as int;

    final id = message.data['id'] as String;
    api.markNotificationAsRead(id);

    return VideoApp(videoUrl: videoUrl);
  }
}

