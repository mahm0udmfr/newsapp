import 'package:flutter/material.dart';
import 'package:newsapp/category/category_details_view_model.dart';
import 'package:newsapp/category/source_tab_widget.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late CategoryDetailsViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = CategoryDetailsViewModel();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    viewModel.errorMessage!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: const Text("Try Again"),
                  ),
                ],
              ),
            );
          } else if (viewModel.sourcesList == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.grey,
              ),
            );
          } else {
            return SourceTabWidget();
          }
        },
      ),
    );
  }
}
