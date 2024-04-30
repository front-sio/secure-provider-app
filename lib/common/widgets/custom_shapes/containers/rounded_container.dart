import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SeRoundedContainer extends StatelessWidget {
  const SeRoundedContainer({
    super.key, 
    this.width, 
    this.height, 
    this.radius = SecuriteSize.cardRadiusLg, 
    this.padding,
    this.showBorder = false, 
    this.borderColor = SecuriteColors.borderPrimary,
    this.child, 
    this.backgroundColor = SecuriteColors.white, 
    this.margin
    });

  final double? width;
  final double? height;
  final double radius;
  final bool showBorder;
  final Widget? child;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}