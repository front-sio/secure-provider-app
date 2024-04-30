import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class SeDivider extends StatelessWidget {
  const SeDivider({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? SecuriteColors.darkGrey: SecuriteColors.grey, indent: 60, endIndent: 5, thickness: 0.5,)),
        Text(text.capitalize!, style: Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: dark ? SecuriteColors.darkGrey: SecuriteColors.grey, indent: 5, endIndent: 60, thickness: 0.5,)),
      ],
      );
  }
}
