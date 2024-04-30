import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';
import 'package:shimmer/shimmer.dart';

class SeShimmerEffect extends StatelessWidget {
  const SeShimmerEffect({super.key, required this.width, required this.height, this.radius = 65, this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? SecuriteColors.darkGrey : SecuriteColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),

    );
  }
}