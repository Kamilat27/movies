import 'package:flutter/material.dart';

class AppBar extends StatelessWidget {
  final String title;
  const AppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,


    );
  }
}
