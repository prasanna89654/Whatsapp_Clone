import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/colors.dart';
import 'package:whatsapp/widgets/group_creator.dart';

import 'info.dart';

class Groupscreen extends StatefulWidget {
  const Groupscreen({super.key});

  @override
  State<Groupscreen> createState() => _GroupscreenState();
}

class _GroupscreenState extends State<Groupscreen> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tabColor,
        title: isPressed
            ? Text("Search")
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select Contact",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "256 contacts",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isPressed = true;
                });
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 14, left: 5, right: 9),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  height: 80,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: tabColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.people,
                  ),
                ),
                title: Text("New Group"),
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Container(
                  height: 80,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: tabColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.people,
                  ),
                ),
                title: Text("New Contact"),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.72,
                child: ListView.builder(
                  itemCount: info.length,
                  itemBuilder: (context, index) {
                    return Gcreator(
                        image: info[index]['profilePic'].toString(),
                        name: info[index]['name'].toString(),
                        title: info[index]['message'].toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
