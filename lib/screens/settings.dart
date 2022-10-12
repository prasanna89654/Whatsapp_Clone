import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/info.dart';

import '../widgets/settings_builder.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 12, right: 3),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage:
                      NetworkImage(info[4]['profilePic'].toString()),
                ),
                title: Text(
                  info[4]['name'].toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Hey! there I am using Whatsapp"),
                trailing: Icon(Icons.qr_code, size: 30),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 17, right: 3),
                  child: Column(
                    children: const [
                      ListTile(
                        leading: Icon(
                          Icons.key,
                          size: 30,
                        ),
                        title: Text(
                          "Account",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Privacy,security,change number",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.message,
                          size: 30,
                        ),
                        title: Text(
                          "Chats",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Theme,wallpapers,chat history",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications_active,
                          size: 30,
                        ),
                        title: Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Message,group & call tones",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.storage,
                          size: 30,
                        ),
                        title: Text(
                          "Storage and data",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Network usage, auto-download",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.help,
                          size: 30,
                        ),
                        title: Text(
                          "Help",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Contact us",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.people,
                          size: 30,
                        ),
                        title: Text(
                          "Invite a friend",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
