import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_styles.dart';

// ignore: must_be_immutable
class DrawerItemSection extends StatelessWidget {
  String imagePath;
    String text;
   DrawerItemSection({super.key,required this.imagePath,required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [Image(image: AssetImage(imagePath)),
      Text(text,style: AppStyles.bold20White,)
      ],
      
    );
  }
}
