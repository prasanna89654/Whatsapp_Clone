// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp/screens/call_screen.dart';
import 'package:whatsapp/screens/camera_screen.dart';
import 'package:whatsapp/screens/settings.dart';
import 'package:whatsapp/screens/status_screen.dart';
import 'package:whatsapp/widgets/colors.dart';
import 'package:whatsapp/widgets/contact_list.dart';
import 'package:whatsapp/widgets/create_group.dart';

class mobileScreenLayout extends StatelessWidget {
  const mobileScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar(
              elevation: 0,
              backgroundColor: appBarColor,
              title: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "Whatsapp",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, right: 15),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                      )),
                ),
                PopupMenuButton(
                  onSelected: (int menu) {
                    if (menu == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Groupscreen(),
                          ));
                    } else if (menu == 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingPage(),
                          ));
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem<int>(
                        value: 0,
                        child: Text("New group"),
                      ),
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text("New broadcast"),
                      ),
                      PopupMenuItem<int>(
                        value: 2,
                        child: Text("WhatsApp Web"),
                      ),
                      PopupMenuItem<int>(
                        value: 3,
                        child: Text("Starred messages"),
                      ),
                      PopupMenuItem<int>(
                        value: 4,
                        child: Text("Payments"),
                      ),
                      PopupMenuItem<int>(
                        value: 5,
                        child: Text("Settings"),
                      ),
                    ];
                  },
                )
              ],
            ),
          ),
          body: Column(
            children: [
              Container(
                color: appBarColor,
                child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: tabColor,
                    isScrollable: true,
                    indicatorColor: tabColor,
                    indicatorWeight: 4,
                    labelStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    tabs: [
                      Container(
                        width: 25,
                        child: Tab(
                          icon: Icon(Icons.camera_alt),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Tab(
                          child: Row(children: [
                            Text("CHATS"),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "4",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Tab(
                          child: Text("STATUS"),
                        ),
                      ),
                      Container(
                        width: 90,
                        child: Tab(
                          child: Text("CALL"),
                        ),
                      ),
                    ]),
              ),
              Flexible(
                  flex: 1,
                  child: TabBarView(children: [
                    CameraScreen(),
                    ContactList(),
                    StatusPage(),
                    CallScreen(),
                  ]))
            ],
          ),
        ));
  }
}
