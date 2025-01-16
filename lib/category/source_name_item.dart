import 'package:flutter/material.dart';
import 'package:newsapp/model/source_response.dart';

// ignore: must_be_immutable
class SourceNameItem extends StatelessWidget {
  Sources sources;
  bool isSelected;
  SourceNameItem({super.key, required this.sources, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      sources.name ?? "",
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}
