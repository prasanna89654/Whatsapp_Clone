import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/scheduler.dart';
import 'package:whatsapp/widgets/colors.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key, required this.messages}) : super(key: key);
  List? messages;

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  ScrollController _myController = ScrollController();
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _myController.jumpTo(_myController.position.maxScrollExtent);
    });
    return ListView.builder(
        controller: _myController,
        itemCount: widget.messages!.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,

            // color: Colors.red,
            child: Bubble(
              style: BubbleStyle(
                borderWidth: 15,
              ),
              margin: const BubbleEdges.only(top: 10),
              alignment: Alignment.topRight,
              nip: BubbleNip.rightTop,
              color: messageColor,
              child: Text(
                widget.messages![index],
                style: TextStyle(fontSize: 20),
              ),
              showNip: true,
            ),
          );
        });
  }
}
