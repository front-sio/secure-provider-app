import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:secureprovider/common/widgets/images/se_circular_image.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class SeRequestListItems extends StatelessWidget {
  const SeRequestListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: SecuriteSize.spaceBtwItem,),
      itemCount: 12,
      shrinkWrap: true,
      itemBuilder: (_, index) => SeRoundedContainer(
        padding: const EdgeInsets.all(SecuriteSize.sm),
        showBorder: true,
        backgroundColor: dark ? SecuriteColors.dark : SecuriteColors.light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              const SizedBox(width: SecuriteSize.spaceBtwItem /2,),
              // status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Accepted', style: Theme.of(context).textTheme.bodyLarge!.apply(color: Colors.blue),),
                  ],
                ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34, size: SecuriteSize.iconSm,))
            ],
            ),
      
      
            Row(children: [
              const SizedBox(width: 40, height: 40, child: SeCircularImage(image: 'assets/services/services.jpg',)),
              const SizedBox(width: SecuriteSize.spaceBtwItem /2,),
              // status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Masanja Joseph', style: Theme.of(context).textTheme.bodyLarge,),
                    Text('Kivule magole "B"', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
             
            ],
            ),
          ],
        ),
      ),
    );
  }
}