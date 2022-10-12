// import 'package:flutter/material.dart';
// import 'package:bubble/bubble.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:whatsapp/widgets/colors.dart';

// class MessagePage extends StatefulWidget {
//   MessagePage({Key? key, required this.messages}) : super(key: key);
//   List? messages;

//   @override
//   _MessagePageState createState() => _MessagePageState();
// }

// class _MessagePageState extends State<MessagePage> {
//   ScrollController _myController = ScrollController();
//   @override
//   Widget build(BuildContext context) {
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       _myController.jumpTo(_myController.position.maxScrollExtent);
//     });
//     return ListView.builder(
//         controller: _myController,
//         itemCount: widget.messages!.length,
//         itemBuilder: (context, index) {
//           return Container(
//             height: 65,

//             // color: Colors.red,
//             child: Bubble(
//               style: BubbleStyle(
//                 borderWidth: 55,
//               ),
//               margin: const BubbleEdges.only(top: 10),
//               alignment: Alignment.topRight,
//               nip: BubbleNip.rightTop,
//               color: messageColor,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Text(
//                     widget.messages![index],
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   Text(
//                     "02:14",
//                     style: TextStyle(fontSize: 10),
//                   )
//                 ],
//               ),
//               showNip: true,
//             ),
//           );
//         });
//   }
// }
