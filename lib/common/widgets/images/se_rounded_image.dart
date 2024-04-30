import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';

class SeRoundedImage extends StatelessWidget {
  const SeRoundedImage({
    Key? key,
    this.width,
    this.height,
    this.borderRadius = SecuriteSize.md,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.isNetworkImage = false,
    this.border,
    this.backgroundColor = SecuriteColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final double borderRadius;
  final String imageUrl;
  final bool applyImageRadius;
  final bool isNetworkImage;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: SizedBox(
            width: width,
            height: height,
            child: isNetworkImage
                ? Image.network(
                    imageUrl,
                    fit: fit,
                    width: width,
                    height: height,
                  )
                : Image.asset(
                    imageUrl,
                    fit: fit,
                    width: width,
                    height: height,
                  ),
          ),
        ),
      ),
    );
  }
}
