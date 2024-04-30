import 'package:flutter/material.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });
  final String image, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
      child: Column(
        children: [
          Image(
            width: SecuriteHelperFunction.screenWidth() * 0.8,
            height: SecuriteHelperFunction.screenHeight() * 0.6,
            image: AssetImage(image)),
            
            Text(title,
             style: Theme.of(context).textTheme.headlineMedium,
             textAlign: TextAlign.center,
             ),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),
            Text(
             subtitle,
             style:  Theme.of(context).textTheme.bodyMedium,
             textAlign: TextAlign.center,
             ),
        ],
      ),
    );
  }
}
