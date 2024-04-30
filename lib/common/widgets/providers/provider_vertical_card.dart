import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/styles/shadow.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:secureprovider/common/widgets/images/se_circular_image.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class SeProviderVerticalCard extends StatelessWidget {
  const SeProviderVerticalCard({
    super.key, 
    this.providerName, 
    this.providerType, 
    this.providerService, 
    required this.image, 
    this.ratingCount, 
    this.onTap
    });


  final String? providerName, providerType, providerService;
  final String image;
  final double? ratingCount;
  final VoidCallback? onTap;


  @override
  Widget build(BuildContext context) {
    final darkMode = SecuriteHelperFunction.isDarkMode(context);
    return GestureDetector(
  onTap: onTap,
  child: Container(
    width: 240,
    padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
      boxShadow: [SeShadowStyle.verticalProviderShadow],
      borderRadius: BorderRadius.circular(SecuriteSize.providerImageRadius),
      color: darkMode ? SecuriteColors.darkGrey : SecuriteColors.light,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center everything vertically
      children: [
        // Thumbnail and bluetick
        SeRoundedContainer(
          padding: const EdgeInsets.all(SecuriteSize.sm),
          width: 180,
          height: 180,
          backgroundColor: darkMode ? const Color.fromARGB(200, 39, 39, 39) : SecuriteColors.light,
          child: Center(
            child: Stack(
              children: [
                SeCircularImage(width: 100, height: 100, image: image),
                // Blue tick
              ],
            ),
          ),
        ),
        const SizedBox(height: SecuriteSize.spaceBtwItem),
        // Details
        Padding(
          padding: const EdgeInsets.only(left: SecuriteSize.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center text horizontally
                children: [
                  Text(
                    providerName!.capitalize!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall!.apply(overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const SizedBox(width: SecuriteSize.spaceBtwItem / 2),
              Text(providerType!.capitalize!, style: Theme.of(context).textTheme.labelLarge!.apply(overflow: TextOverflow.ellipsis)),
              const SizedBox(width: SecuriteSize.spaceBtwItem / 2),
              Text(providerService!.capitalize!, style: Theme.of(context).textTheme.labelLarge!.apply(overflow: TextOverflow.ellipsis)),
              const SizedBox(width: SecuriteSize.spaceBtwItem / 2),
              
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: SecuriteSize.spaceBtwItem / 2),
                  Text(ratingCount?.toString() ?? '', style: Theme.of(context).textTheme.labelMedium!.apply(overflow: TextOverflow.ellipsis)),

                ],
              ),
               
              // SizedBox(height: SecuriteSize.spaceBtwItem / 2),
              // SizedBox(
              //   width: double.infinity,
              //   child: Container(
              //     padding: EdgeInsets.all(SecuriteSize.spaceBtwItem / 2),
              //     decoration: BoxDecoration(
              //       color: SecuriteColors.dark,
              //       borderRadius: BorderRadius.circular(SecuriteSize.cardRadiusSm),
              //     ),
              //     child: Center(
              //       child: Text(
              //         'Book',
              //         style: Theme.of(context).textTheme.labelSmall!.apply(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: SecuriteSize.spaceBtwItem),
            ],
          ),
        ),
      ],
    ),
  ),
);
  }
}