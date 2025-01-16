import 'package:flutter/material.dart';
import 'package:newsapp/category/source_tab_widget.dart';
import 'package:newsapp/model/source_response.dart';
import 'package:newsapp/utils/api_manager.dart';
import 'package:newsapp/utils/colors.dart';

class CategoryDetails extends StatefulWidget {
  static const String routename = 'categorydetails';
  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponce?>(
      future: ApiManager.getSources(),
      builder: (context, snapshot) {
        //todo: Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.grey,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Somethig Went Wrong"),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text("Try Again")),
            ],
          );
        }

        ///todo: server error
        if (snapshot.data!.status != 'ok') {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.grey,
            ),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(
                  onPressed: () {
                    ApiManager.getSources();
                    setState(() {});
                  },
                  child: Text("Try Again")),
            ],
          );
        }
//server success
        var sourcesList = snapshot.data!.sources!;
        return SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
