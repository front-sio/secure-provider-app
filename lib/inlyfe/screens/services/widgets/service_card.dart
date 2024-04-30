import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/images/se_circular_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    required this.showBorder,
    this.onTap,
  }) : super(key: key);

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SeRoundedContainer(
        padding: const EdgeInsets.all(SecuriteSize.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: SeCircularImage(
                isNetworkImage: false,
                backgroundColor: Colors.transparent,
                image: 'assets/services/services.jpg',
                // overlayColor: SecuriteHelperFunction.isDarkMode(context) ? SecuriteColors.white : SecuriteColors.black,
              ),
            ),
            const SizedBox(width: SecuriteSize.spaceBtwItem / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Salon',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(width: SecuriteSize.sm),
                      const Icon(Iconsax.verify5, color: Colors.blue, size: SecuriteSize.iconXs),
                    ],
                  ),
                  Text(
                    '123 providers'.capitalize!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
