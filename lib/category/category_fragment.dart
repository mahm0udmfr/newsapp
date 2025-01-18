import 'package:flutter/material.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/utils/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:newsapp/providers/apptheme_provider.dart';
import 'package:provider/provider.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoryList = [];
  Function onViewAllClicked;
  CategoryFragment({super.key, required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppthemeProvider>(context);
    categoryList = CategoryModel.getCategoriesList(
        themeProvider.apptheme != ThemeMode.light ? true : false);
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: index % 2 == 0
                          ? Alignment.bottomRight
                          : Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            categoryList[index].imagePath,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * 0.04,
                              vertical: screenSize.height * 0.02),
                          child: ToggleSwitch(
                            customWidths: [
                              screenSize.width * 0.25,
                              screenSize.width * 0.15
                            ],
                            cornerRadius: 20.0,
                            activeBgColors: [
                              [Theme.of(context).primaryColor],
                              [AppColor.grey]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: AppColor.grey,
                            inactiveFgColor: Colors.white,
                            initialLabelIndex: 1,
                            totalSwitches: 2,
                            customWidgets: [
                              Text(
                                "View All",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              CircleAvatar(
                                backgroundColor: AppColor.black,
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                              )
                            ],
                            radiusStyle: true,
                            onToggle: (indexToggel) {
                              onViewAllClicked(categoryList[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: screenSize.height * 0.02,
                    );
                  },
                  itemCount: categoryList.length))
        ],
      ),
    );
  }
}
