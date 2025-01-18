import 'package:newsapp/utils/imageassets.dart';

class CategoryModel {
  String id;
  String imagePath;
  String title;

  CategoryModel(
      {required this.id, required this.imagePath, required this.title});
//business  entertainment  general  health  science  sports  technology
  static List<CategoryModel> getCategoriesList(bool isDark) {
    return [
      CategoryModel(
          id: "general",
          imagePath:
              !isDark ? ImageAssets.generaldark : ImageAssets.generallight,
          title: "General"),
      CategoryModel(
          id: "business",
          imagePath:
          !    isDark ? ImageAssets.businessdark : ImageAssets.businesslight,
          title: "Business"),
      CategoryModel(
          id: "sports",
          imagePath: !isDark ? ImageAssets.sportsdark : ImageAssets.sportslight,
          title: "Sports"),
      CategoryModel(
          id: "technology",
          imagePath:
              !isDark ? ImageAssets.technologydark : ImageAssets.technologylight,
          title: "Technology"),
      CategoryModel(
          id: "entertainment",
          imagePath: !isDark
              ? ImageAssets.entertainmentdark
              : ImageAssets.entertaimentlight,
          title: "Entertainment"),
      CategoryModel(
          id: "health",
          imagePath: !isDark ? ImageAssets.healthdark : ImageAssets.healthlight,
          title: "Health"),
      CategoryModel(
          id: "science",
          imagePath:
              !isDark ? ImageAssets.sciencedark : ImageAssets.sciencelight,
          title: "Science"),
    ];
  }



}
