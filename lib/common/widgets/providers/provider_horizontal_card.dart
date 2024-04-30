import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:secureprovider/common/widgets/images/se_circular_image.dart';

import 'package:secureprovider/common/widgets/text/service_title.dart';
import 'package:secureprovider/inlyfe/models/provider.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/enums.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

import '../../../inlyfe/controllers/service_controller.dart';

class SeProviderCardHorizontal extends StatelessWidget {
  const SeProviderCardHorizontal({super.key, required this.provider});


  final Provider provider;


  @override
  Widget build(BuildContext context) {
    final controller = ServiceController.instance;
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Row(
      children: [
        Container(
          width: 380,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SecuriteSize.providerImageRadius),
            color: dark ? SecuriteColors.darkerGrey : SecuriteColors.softGrey,
          ),
        
          child: Row(
            children: [
              SeRoundedContainer(
                height: 120,
                padding: const EdgeInsets.all(SecuriteSize.sm),
                backgroundColor: dark ? SecuriteColors.dark : SecuriteColors.light,
                child: Stack(
                  children: [
                    // Thumbnail image
                    SizedBox(width: 120, height: 120, child: SeCircularImage(width: 40, height: 50, image: provider.thumbnail, isNetworkImage: true,)),
                  ],
                ),
              ),
              const SizedBox(
                width: 172,
                child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 4.0, left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SeServiceTitle(title: 'masanja joseph', serviceTextSize: TextSizes.large,),
                                    SizedBox(width: 10,),
                                    Icon(Iconsax.verify, color: Colors.blue,),
                                  ],
                                ),
                                SizedBox(height: SecuriteSize.spaceBtwItem / 2,),
                                SeServiceTitle(title: 'Salon', ),
                                SeServiceTitle(title: 'Individual',),
        
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.amberAccent,),
                                    SizedBox(width: 12,),
                                    SeServiceTitle(title: '4.5',),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
              )
            ],
          ),
        ),
      ],
    );
  }
}