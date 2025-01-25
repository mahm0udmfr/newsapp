import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/category/cubit/source_state.dart';
import 'package:newsapp/category/cubit/source_view_model.dart';
import 'package:newsapp/category/source_tab_widget.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/utils/colors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;
  CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel = SourceViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourceState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColor.grey,
            ),
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
                      viewModel.getSources(widget.category.id);
                    },
                    child: Text("Try Again")),
              ],
            ),
          );
        } else if (state is SourceSuccessState) {
          return SourceTabWidget(sourcesList: state.sourcesList);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
