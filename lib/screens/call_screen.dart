import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/colors.dart';
import 'package:whatsapp/widgets/info.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        backgroundColor: Color.fromARGB(255, 13, 146, 133),
        child: Icon(Icons.call_sharp),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: info.length,
          itemBuilder: (context, i) => Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage:
                      NetworkImage(info[i]['profilePic'].toString()),
                  radius: 27.0,
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      info[i]['name'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 17.0),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 1.0),
                  child: Row(
                    children: [
                      if (i % 2 == 0)
                        Icon(
                          Icons.call_missed_rounded,
                          color: Colors.red,
                        )
                      else
                        Icon(
                          Icons.call_made,
                          color: tabColor,
                        ),

                      // Icon(
                      //   i % 2 == 0
                      //       ? Icons.call_missed_rounded
                      //       : Icons.call_made,
                      //   size: 23,
                      //   color: tabColor,
                      // ),
                      Text(
                        " Yesterday,  ${info[i]['time'].toString()}",
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 15.0),
                      ),
                    ],
                  ),
                ),
                trailing: Icon(
                  i % 2 == 0 ? Icons.call : Icons.videocam,
                  color: tabColor,
                ),
              ),
              Divider(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
