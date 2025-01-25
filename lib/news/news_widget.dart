import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/news/cubit/news_source_state.dart';
import 'package:newsapp/news/cubit/news_widget_view_model.dart';
import 'package:newsapp/news/news_bottom_sheet.dart';
import 'package:newsapp/news/news_item.dart';


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
    super.initState();
    viewModel.getNews(widget.source.id!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsWidgetViewModel, NewsSourceState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SourceErrorState) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getNews(widget.source.id!);
                    },
                    child: Text("Try Again")),
              ],
            ),
          );
        } else if (state is SourseSuccessState) {
          return ListView.builder(
            
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    showNewsBottomShhet(context, index, state.newsList!);
                  },
                  child: NewsItem(news: state.newsList![index]));
            },
            itemCount: state.newsList!.length,
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  void showNewsBottomShhet(
      BuildContext context, int selectedCat, List newsList) {
    showModalBottomSheet(
      context: context,
      builder: (context) => NewsBottomSheet(
        news: newsList,
        selectedNew: selectedCat,
      ),
    );
  }
}
