import 'package:flutter/material.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/news/news_bottom_sheet.dart';
import 'package:newsapp/news/news_item.dart';
import 'package:newsapp/news/news_widget_view_model.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  Sources source;

  final ScrollController scrollController = ScrollController();
  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  void initState() {
    viewModel.getNewBySourceId(widget.source.id??"");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
          builder: (context, value, child) {
            if (viewModel.errorMessage != null) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      viewModel.errorMessage!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getNewBySourceId(widget.source.id!);
                        },
                        child: Text("Try Again")),
                  ],
                ),
              );
            } else if (viewModel.newsList == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.grey,
                ),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        showNewsBottomShhet(context, index);
                      },
                      child: NewsItem(news: viewModel.newsList![index]));
                },
                itemCount: viewModel.newsList!.length,
              );
            }
          },
        ));
  }

  void showNewsBottomShhet(BuildContext context, int selectedCat) {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewsBottomSheet(
        news: viewModel.newsList!,
        selectedNew: selectedCat,
      ),
    );
  }
}
