import 'package:flutter/material.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/news/news_bottom_sheet.dart';
import 'package:newsapp/news/news_item.dart';
import 'package:newsapp/utils/api_manager.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  var newsList = [];
  final ScrollController scrollController = ScrollController();
  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNewsBySourceId(widget.source.id ?? ""),
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
                      ApiManager.getNewsBySourceId(widget.source.id ?? "");
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
                      ApiManager.getNewsBySourceId(widget.source.id ?? "");
                      setState(() {});
                    },
                    child: Text("Try Again")),
              ],
            ),
          );
        }
        widget.newsList = snapshot.data!.articles!;
        return ListView.builder(
          controller:widget.scrollController ,
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
