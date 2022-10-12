import 'package:flutter/material.dart';

class Gcreator extends StatefulWidget {
  Gcreator(
      {Key? key, required this.image, required this.name, required this.title})
      : super(key: key);

  final String image;
  final String name;
  final String title;

  @override
  State<Gcreator> createState() => _GcreatorState();
}

class _GcreatorState extends State<Gcreator> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          widget.image,
        ),
        radius: 28,
      ),
      title: Text(widget.name),
      subtitle: Text(widget.title),
    );
  }
}
