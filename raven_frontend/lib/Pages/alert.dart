import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Alert extends StatelessWidget {
  const Alert({Key? key});

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;

    return Scaffold(
      appBar: AppBar(title: Text("Alerts")),
      body: Column(
        children: [
          Text(message.notification!.title.toString()),
          Text(message.notification!.body.toString()),
          Text(message.data.toString()),
          ElevatedButton(
            onPressed: () {
              // Retrieve the video URL from the data payload
              final videoUrl = message.data['videoUrl'];

              if (videoUrl != null) {
                // Navigate to the VideoPlayerScreen and pass the video URL
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
                  ),
                );
              }
            },
            child: Text('Play Video'),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create a VideoPlayerController and set the URL
    _controller = VideoPlayerController.network(widget.videoUrl);

    // Initialize the controller and wait until it's initialized
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use it to display the video
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a loading spinner
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Play or pause the video when the floating action button is pressed
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Ensure that the controller is disposed when the widget is disposed
    _controller.dispose();
    super.dispose();
  }
}
