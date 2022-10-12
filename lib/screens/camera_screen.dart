import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:whatsapp/widgets/cameraview.dart';

import 'video_view.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  Future<void>? cameraValue;
  bool flash = false;
  bool iscamerafront = true;
  bool isRecording = false;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = cameraController!.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FutureBuilder(
          future: cameraValue,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(cameraController!),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),

      Positioned(
        bottom: 0.0,
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        flash = !flash;
                      });
                      flash
                          ? cameraController!.setFlashMode(FlashMode.torch)
                          : cameraController!.setFlashMode(FlashMode.off);
                    },
                    icon: Icon(
                      flash ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                      size: 28,
                    )),
                GestureDetector(
                  onLongPress: () async {
                    await cameraController!.startVideoRecording();
                    setState(() {
                      isRecording = true;
                    });
                  },
                  onLongPressUp: () async {
                    XFile videopath =
                        await cameraController!.stopVideoRecording();
                    setState(() {
                      isRecording = false;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => VideoViewPage(
                                  path: videopath.path,
                                )));
                  },
                  onTap: () {
                    if (!isRecording) takePhoto(context);
                  },
                  child: isRecording
                      ? Icon(Icons.radio_button_on, color: Colors.red, size: 80)
                      : Icon(
                          Icons.panorama_fish_eye,
                          color: Colors.white,
                          size: 70,
                        ),
                ),
                IconButton(
                  icon: Transform.rotate(
                    angle: transform,
                    child: Icon(Icons.flip_camera_ios,
                        color: Colors.white, size: 28),
                  ),
                  onPressed: () async {
                    setState(() {
                      iscamerafront = !iscamerafront;
                      transform = transform + pi;
                    });
                    int cameraPos = iscamerafront ? 0 : 1;
                    cameraController = CameraController(
                        cameras![cameraPos], ResolutionPreset.high);
                    cameraValue = cameraController!.initialize();
                  },
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Hold for Video, tap for photo",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )
          ]),
        ),
      )

      // child:
    ]));
  }

  void takePhoto(BuildContext context) async {
    XFile file = await cameraController!.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => CameraViewPage(
                  path: file.path,
                )));
  }
}
