import 'package:flutter/material.dart';
import 'package:newsapp/category/category_details_view_model.dart';
import 'package:newsapp/category/source_name_item.dart';
import 'package:newsapp/news/news_widget.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:provider/provider.dart';

class SourceTabWidget extends StatelessWidget {
  const SourceTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategoryDetailsViewModel>(context);
    

    return DefaultTabController(
      length: viewModel.sourcesList?.length ?? 0,
      child: Column(
        children: [
          TabBar(
            onTap: (value) {
              viewModel.changeIndex(value);
            },
            tabAlignment: TabAlignment.start,
            dividerColor: AppColor.transparent,
            isScrollable: true,
            tabs: viewModel.sourcesList!.map((source) {
              return SourceNameItem(
                sources: source,
                isSelected: viewModel.selectedIndex ==
                    viewModel.sourcesList!.indexOf(source),
              );
            }).toList(),
          ),
       Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: viewModel.sourcesList!.map((source) {
                return NewsWidget(source: source);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

