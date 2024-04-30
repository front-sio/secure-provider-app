import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SeGridLayoutView extends StatelessWidget {
  const SeGridLayoutView({
    super.key, 
    required this.itemCount, 
    this.mainAxisExtent = 350.0, 
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: 
       SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: SecuriteSize.gridViewSpacing,
        crossAxisSpacing: SecuriteSize.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
        ), 
      itemBuilder: itemBuilder);
  }
}

