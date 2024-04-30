import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/colors.dart';

class SeCircularContainer extends StatelessWidget {
  const SeCircularContainer({
    super.key, 
    this.width = 400, 
    this.height = 400, 
    this.radius = 400, 
    this.padding = 0, 
    this.margin,
    this.child, 
    this.backgroundColor = SecuriteColors.white
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor, 
      ),
      child: child,
    );
  }
}