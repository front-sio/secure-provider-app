import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/inlyfe/controllers/home_controller.dart';
import 'package:secureprovider/utils/constants/colors.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/images/se_rounded_image.dart';
import '../../../../utils/constants/size.dart';

class SePromoSlider extends StatelessWidget {
  const SePromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => SeRoundedImage(imageUrl: url,)).toList(),
          options: CarouselOptions(
            onPageChanged: (index, _)=>controller.updatePageIndicator(index),
            viewportFraction: 0.9
          )),
          SizedBox(height: SecuriteSize.spaceBtwItem),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                 for(int i = 0; i < banners.length; i++) 
                 SeCircularContainer(
                  margin: EdgeInsets.only(left: 10), 
                  width: 20, 
                  height: 4, 
                  backgroundColor: controller.carouselCurentIndex.value == i ? SecuriteColors.primary : Colors.grey,),
                ],
              ),
            ),
          )
      ],
    );
  }
}

