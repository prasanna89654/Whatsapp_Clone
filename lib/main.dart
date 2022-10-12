import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camera_screen.dart';

import 'package:whatsapp/screens/mobile_screen_layout.dart';
import 'package:whatsapp/screens/web_screen_layout.dart';
import 'package:whatsapp/widgets/colors.dart';

import 'package:whatsapp/widgets/responsive_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: mobileScreenLayout(),
        webScreenLayout: webScreenLayout(),
      ),
    );
  }
}
