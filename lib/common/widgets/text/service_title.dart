import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/enums.dart';

class SeServiceTitle extends StatelessWidget {
  const SeServiceTitle({
    super.key, 
    required this.title, 
    this.maxLines = 1, 
    this.color, 
    this.textAlign = TextAlign.center, 
    this.serviceTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes serviceTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title, 
      overflow: TextOverflow.ellipsis, 
      maxLines: maxLines, 
      style: serviceTextSize == TextSizes.small ? 
      Theme.of(context).textTheme.labelMedium!.apply(color: color):
       serviceTextSize == TextSizes.medium ?
       Theme.of(context).textTheme.bodyLarge!.apply(color: color) :
       serviceTextSize == TextSizes.large ?
       Theme.of(context).textTheme.titleLarge!.apply(color: color) : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
       
  }
}