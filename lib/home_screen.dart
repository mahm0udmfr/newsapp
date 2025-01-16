import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routename = 'homescreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: screenSize.height * 0.035,
              ))
        ],
      ),
      drawer: Drawer(),
    );
  }
}
