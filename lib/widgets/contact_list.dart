import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_screen.dart';
import 'package:whatsapp/widgets/colors.dart';

import 'info.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        backgroundColor: Color.fromARGB(255, 13, 146, 133),
        child: Icon(Icons.message),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 13),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: info.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ChatScreen(
                              image: info[index]['profilePic'].toString(),
                              name: info[index]['name'].toString(),
                            );
                          },
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          title: Text(
                            info[index]['name'].toString(),
                            style: TextStyle(fontSize: 18),
                          ),
                          subtitle: Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                info[index]['message'].toString(),
                                style: TextStyle(fontSize: 15),
                              )),
                          leading: CircleAvatar(
                            radius: 26,
                            backgroundImage: NetworkImage(
                              info[index]['profilePic'].toString(),
                            ),
                          ),
                          trailing: Text(
                            info[index]['time'].toString(),
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      color: dividerColor,
                      indent: 85,
                    ),
                  ],
                );
              })),
    );
  }
}
