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
    return Column(
      children: [
        Bubble(
          alignment: Alignment.center,
          color: Colors.grey,
          child: const Text('TODAY',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 11)),
        ),
        ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              child: Bubble(
                margin: const BubbleEdges.only(top: 10),
                alignment: Alignment.topRight,
                nip: BubbleNip.rightTop,
                color: senderMessageColor,
                // child: Text(widget.messages![index]),
                child: Text("Hello"),
                showNip: true,
              ),
            );
          },
          // itemCount: widget.messages!.length,
        )
      ],
    );
  }
}
