import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/colors.dart';

import '../widgets/info.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color.fromARGB(255, 13, 146, 133),
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12, right: 3),
        child: ListView(
          children: <Widget>[
            ListTile(
              contentPadding: const EdgeInsets.only(left: 12, bottom: 10),
              title: Text(
                'My Status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                info[0]['time'].toString(),
                style: TextStyle(color: Colors.grey),
              ),
              leading: Container(
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        NetworkImage(info[0]['profilePic'].toString()),
                  ),
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: tabColor, width: 3.0),
                      borderRadius: BorderRadius.circular(30.0))),
              trailing: PopupMenuButton(
                itemBuilder: (context) {
                  return [PopupMenuItem(child: Text("Delete Story"))];
                },
              ),
            ),
            Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 3.0),
              child: Text(
                'Recent updates',
                style: TextStyle(color: Colors.grey.shade200, fontSize: 17),
              ),
            ),
            Container(
              height: height * 0.36,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Divider(
                        height: 10.0,
                        indent: 80.0,
                        endIndent: 5.0,
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: tabColor, width: 3.0),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                                info[index]['profilePic'].toString()),
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        title: Text(
                          info[index]['name'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          info[index]['time'].toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
            Container(
              height: 30.0,
              padding: EdgeInsets.only(left: 15.0, top: 5.0, bottom: 3.0),
              child: Text(
                'Viewed updates',
                style: TextStyle(color: Colors.grey.shade200, fontSize: 17),
              ),
            ),
            Container(
              height: height * 0.36,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Divider(
                        height: 10.0,
                        indent: 80.0,
                        endIndent: 5.0,
                      ),
                      ListTile(
                        leading: Container(
                          padding: EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: tabColor, width: 3.0),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: CircleAvatar(
                            radius: 24,
                            backgroundImage: NetworkImage(
                                info[index]['profilePic'].toString()),
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        title: Text(
                          info[index]['name'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          info[index]['time'].toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
