import 'package:flutter/material.dart';
import 'package:newsapp/category/source_name_item.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/news/news_widget.dart';
import 'package:newsapp/utils/colors.dart';

class SourceTabWidget extends StatefulWidget {
  List<Sources> sourcesList;

  SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (value) {
                selectedIndex = value;
                setState(() {});
              },
              tabAlignment: TabAlignment.start,
              dividerColor: AppColor.transparent,
              isScrollable: true,
              tabs: widget.sourcesList.map((source) {
                return SourceNameItem(
                    sources: source,
                    isSelected:
                        selectedIndex == widget.sourcesList.indexOf(source));
              }).toList()),
          Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
