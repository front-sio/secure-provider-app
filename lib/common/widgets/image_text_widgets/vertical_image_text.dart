import 'package:flutter/material.dart';

import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_functions.dart';

class SeVerticalImageText extends StatelessWidget {
  const SeVerticalImageText({
    Key? key, 
    required this.imageUrl, 
    required this.title, 
    this.textColor = Colors.white, 
    this.backgroundColor, 
    this.onTap,
  }) : super(key: key);

  final String imageUrl; // Change image to imageUrl
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SecuriteSize.spaceBtwItem),
        child: Column(
          children: [
            // Circular
            Container(
              width: 56,
              height: 56,
              padding: EdgeInsets.all(SecuriteSize.sm),
              decoration: BoxDecoration(
                color: backgroundColor ?? (SecuriteHelperFunction.isDarkMode(context) ? Colors.black : Colors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(image: NetworkImage(imageUrl), fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: SecuriteSize.spaceBtwItem / 2),
            SizedBox(
              width: 55,
              child: Text(
                title, 
                style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
