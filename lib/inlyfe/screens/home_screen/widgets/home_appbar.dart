import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/loader/shimmer_effect.dart';
import 'package:secureprovider/features/authentication/controllers/user/user_controller.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/colors.dart';

class SeHomeAppBar extends StatelessWidget {
  const SeHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return  Column(
        children: [
          SeAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enjoy our services'.capitalize!, style: Theme.of(context).textTheme.labelMedium!.apply(color: SecuriteColors.white),),
                Obx(() {
                  if (controller.profileLoading.value){
                    return const SeShimmerEffect(width: 200, height: 30);
                  }else {
                    return Text(controller.user.value.fullName.capitalize!.capitalize!, style: Theme.of(context).textTheme.headlineSmall!.apply(color: SecuriteColors.white),);
                  }
                }),
              ],
            ),
          ),
        ],
      );
    
  }
}
