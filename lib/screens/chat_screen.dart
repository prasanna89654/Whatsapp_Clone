// ignore_for_file: unnecessary_null_comparison

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/audio_screen.dart';
import 'package:whatsapp/screens/camera_page.dart';
import 'package:whatsapp/widgets/colors.dart';

import '../widgets/message.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key, required this.image, required this.name})
      : super(key: key);

  String image;
  String name;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController contr = TextEditingController();
  FocusNode focusnode = FocusNode();
  bool isSendButton = false;
  List messages = [];
  ScrollController _myController = ScrollController();

  // void sendMessage(String message) {
  //   messages.add(message);
  // }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.image),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    widget.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoScreen(
                          picture: widget.image,
                          name: widget.name,
                        ),
                      ));
                },
                icon: Icon(
                  Icons.video_call,
                )),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoScreen(
                          picture: widget.image,
                          name: widget.name,
                        ),
                      ));
                },
                icon: Icon(
                  Icons.call,
                )),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("View Contact"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Media,links,and docs"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Mute notification"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Wallpaper"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("More"),
                  ),
                ];
              },
            )
          ],
        ),
        body: Column(children: [
          Bubble(
            alignment: Alignment.center,
            color: senderMessageColor,
            child: const Text('TODAY',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 13)),
          ),
          Expanded(
              child: ListView.builder(
                  controller: _myController,
                  itemCount: messages.length + 1,
                  itemBuilder: (context, index) {
                    if (index == messages.length) {
                      return Container(
                        height: 70,
                      );
                    }
                    return Bubble(
                      style: BubbleStyle(
                        borderWidth: 55,
                      ),
                      margin: const BubbleEdges.only(top: 10),
                      alignment: Alignment.topRight,
                      nip: BubbleNip.rightTop,
                      color: messageColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            messages[index],
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            "02:14",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                      showNip: true,
                    );
                  })),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10.0),
            child: Row(children: [
              Flexible(
                  child: Container(
                height: height * 0.06,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(right: 10),
                        width: width * 0.37,
                        decoration: BoxDecoration(
                            color: Color(0xFF2D383E),
                            border: Border.all(

                                // Set border color
                                width: 3.0), // Set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                30.0)), // Set rounded corner radius
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Colors.black,
                                  offset: Offset(1, 3))
                            ] // Make rounded corner of border
                            ),
                        // color: Colors.blue,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                "assets/images/smile.png",
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: TextFormField(
                                controller: contr,
                                onChanged: (value) {
                                  if (value.length > 0) {
                                    setState(() {
                                      isSendButton = true;
                                    });
                                  } else {
                                    setState(() {
                                      isSendButton = false;
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: ("Message"),
                                    border: InputBorder.none),
                              ),
                            ),
                            Flexible(
                              child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (builder) => bottomsheet());
                                },
                                icon: Image.asset(
                                  "assets/images/link.png",
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CameraPage(),
                                    ));
                              },
                              icon: Image.asset("assets/images/cameralogo.png"),
                            ),
                          ],
                        ))
                  ],
                ),
              )),
              Container(
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: tabColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        if (isSendButton && contr.text.length > 0) {
                          _myController.animateTo(
                              _myController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOut);
                          setState(() {
                            messages.add(contr.text);
                            isSendButton = false;
                          });
                        }
                        contr.clear();
                      },
                      icon:
                          Icon(isSendButton ? Icons.send : Icons.mic_rounded))),
            ]),
          )
        ]));
  }

  Widget bottomsheet() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 48.0),
      child: Container(
        height: 278,
        child: Card(
          margin: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                iconcreation(Icons.headset, Colors.orange, "Audio"),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.location_pin, Colors.pink, "Location"),
                SizedBox(
                  width: 40,
                ),
                iconcreation(Icons.person, Colors.purple, "Contact"),
              ])
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
