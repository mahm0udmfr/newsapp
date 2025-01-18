import 'package:flutter/material.dart';
import 'package:newsapp/category/category_details.dart';
import 'package:newsapp/category/category_fragment.dart';
import 'package:newsapp/drawer/home_drawer.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/search/search_news.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'homescreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? searchItem;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: searchItem == null
              ? Text(
                  selectedCategory == null ? "Home" : selectedCategory!.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                )
              : TextField(
                  onChanged: (value) {
                    searchItem = value;
                  },
                  style: TextStyle(color: Theme.of(context).indicatorColor),
                  decoration: InputDecoration(
                      hintText: 'Search Here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        borderSide: BorderSide(
                            color: Theme.of(context).indicatorColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).indicatorColor, width: 2),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).indicatorColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Theme.of(context).indicatorColor, width: 2),
                      )),
                ),
          actions: [
            selectedCategory != null
                ? IconButton(
                    onPressed: () {
                      searchItem = "General";
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.search,
                      size: screenSize.height * 0.035,
                    ))
                : SizedBox(),
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(
            onTap: () {
              selectedCategory = null;
              searchItem = null;
              Navigator.pop(context);
              setState(() {});
            },
          ),
        ),
        body: selectedCategory == null
            ? CategoryFragment(
                onViewAllClicked: onViewAllClicked,
              )
            : searchItem == null
                ? CategoryDetails(
                    category: selectedCategory!,
                  )
                : SearchNews(searchText: searchItem));
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;

    setState(() {});
  }
}
