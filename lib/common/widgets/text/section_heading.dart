import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeSectionHeading extends StatelessWidget {
  const SeSectionHeading({
    super.key, 
    this.textColor, 
    this.showActionButton = true, 
    this.buttonTitle = "see all", 
    required this.title, 
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title.capitalize!, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis,),
        if(showActionButton) TextButton(onPressed: onPressed, child:  Text(buttonTitle.capitalize!)),
      ],
    );
  }
}

