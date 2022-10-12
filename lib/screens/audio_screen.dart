import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/colors.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.picture, required this.name})
      : super(key: key);

  final String picture;
  final String name;
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image(
            image: NetworkImage(widget.picture),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 88.0),
            child: Center(
              child: Column(
                children: [
                  Text("End-to-end encrypted"),
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.picture),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80.0),
                    child: Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.call_end,
                            size: 40,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
