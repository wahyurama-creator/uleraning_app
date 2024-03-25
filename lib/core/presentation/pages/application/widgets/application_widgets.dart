import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> pages = [
    const Center(child: Text('Home Page')),
    const Center(child: Text('Search Page')),
    const Center(child: Text('Course Page')),
    const Center(child: Text('Chat Page')),
    const Center(child: Text('Profile Page')),
  ];

  return pages[index];
}
