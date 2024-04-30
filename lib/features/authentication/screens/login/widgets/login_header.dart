import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class SeLoginHeader extends StatelessWidget {
  const SeLoginHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? 'assets/logos/logo.png': 'assets/logos/logo.png'),
          ),
          Text(
            'Welcome back you have been missed.',
            style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: SecuriteSize.sm,),
            Text(
            'Welcome back you have been missed.',
            style: Theme.of(context).textTheme.bodyMedium,
            ),
      ],
    );
  }
}