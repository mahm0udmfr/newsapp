import 'package:flutter/material.dart';
import 'package:newsapp/category/category_details.dart';
import 'package:newsapp/drawer/home_drawer.dart';

class GeneralScreen extends StatelessWidget {
  static const String routename = 'generalscreen';
  const GeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "General",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: screenSize.height * 0.035,
              
              ))
        ],
      ),
      drawer: Drawer(child: HomeDrawer(),),
      
      body: CategoryDetails(),
    );
  }
}
