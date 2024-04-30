import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/styles/spacing_styles.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SecuriteSpacingStyles.paddingWithAppBarHeight,
          child: Column(children: [
            // image
            Image(image: AssetImage(image)),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),
            // title & subtile
            Text(title.capitalize!, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            Text(subtitle.capitalize!, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
            const SizedBox(height: SecuriteSize.defaultSpace,),
            // buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text('Continue'))),
            const SizedBox(height: SecuriteSize.defaultSpace,),
          ],),
          ),
      ),
    );
  }
}