import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/images/se_circular_image.dart';
import 'package:secureprovider/common/widgets/loader/shimmer_effect.dart';

import '../../../features/authentication/controllers/user/user_controller.dart';

class SeUserProfileTile extends StatelessWidget {
  const SeUserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return ListTile(
      leading: const SeCircularImage(image: 'assets/services/services.jpg', width: 50, height: 50, padding: 8,),
      title: Obx(() {
        if (controller.profileLoading.value){
          return const SeShimmerEffect(width: 200, height: 30);
        }{
          return Text(controller.user.value.fullName.capitalize!, style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),);
        }
      }
      ),
      subtitle: Obx((){
         if (controller.profileLoading.value){
          return const SeShimmerEffect(width: 200, height: 30);
        }{
          return Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),);
        }
      } ),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: Colors.white,)),
      );
  }
}