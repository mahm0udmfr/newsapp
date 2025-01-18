import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/utils/app_styles.dart';

class NewsItem extends StatelessWidget {
  Articles news;
  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: screenSize.height * 0.01),
          padding:  EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.02,
          vertical: screenSize.height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).indicatorColor, width: 2),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              width: double.infinity,
              height: screenSize.height*0.21,
              imageUrl: news.urlToImage ?? "",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  maxLines: 1,
                  "by : ${news.author ?? ""}",
                  style: AppStyles.medium12Gray,
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                GetTimeAgo.parse(DateTime.parse(news.publishedAt!)),
                style: AppStyles.medium12Gray,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
