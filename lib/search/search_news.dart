import 'package:flutter/material.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/news/news_bottom_sheet.dart';
import 'package:newsapp/news/news_item.dart';
import 'package:newsapp/utils/api_manager.dart';

class SearchNews extends StatefulWidget {
  late Sources source;
  var newsList = [];
  String? searchText = "General";
  SearchNews({super.key, required this.searchText});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  @override
  Widget build(BuildContext context) {
    return widget.newsList != []
        ? FutureBuilder(
            future: ApiManager.getNewsBySearch(widget.searchText),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Somethig Went Wrong",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsBySearch(widget.searchText);
                            setState(() {});
                          },
                          child: Text("Try Again")),
                    ],
                  ),
                );
              }

              if (snapshot.data!.status != 'ok') {
                Center(
                  child: Column(
                    children: [
                      Text(
                        snapshot.data!.message!,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            ApiManager.getNewsBySearch(widget.searchText);
                            setState(() {});
                          },
                          child: Text("Try Again")),
                    ],
                  ),
                );
              }
              widget.newsList = snapshot.data!.articles!;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        showNewsBottomShhet(context, index);
                      },
                      child: NewsItem(news: widget.newsList[index]));
                },
                itemCount: widget.newsList.length,
              );
            },
          )
        : Center(
            child: Text("Start Searching For Data"),
          );
  }

  void showNewsBottomShhet(BuildContext context, int selectedCat) {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewsBottomSheet(
        news: widget.newsList,
        selectedNew: selectedCat,
      ),
    );
  }
}
