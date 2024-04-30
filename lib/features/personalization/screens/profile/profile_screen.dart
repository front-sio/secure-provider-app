import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/common/widgets/images/se_circular_image.dart';
import 'package:secureprovider/common/widgets/text/section_heading.dart';
import 'package:secureprovider/data/repositories/authentication/authentication_repository.dart';
import 'package:secureprovider/features/personalization/screens/profile/update_name.dart';
import 'package:secureprovider/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:secureprovider/utils/constants/size.dart';

import '../../../authentication/controllers/user/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SeAppBar(showBackArrow: true, title: Text('Profile'),),

      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SeCircularImage(image: 'assets/services/services.jpg'),
                  TextButton(onPressed: (){}, child: Text('Change profile picture'.capitalize!,)),
                ],
              ),
            ),


            // detal
            const SizedBox(height: SecuriteSize.defaultSpace / 2,),
            const Divider(),
            const SizedBox(height: SecuriteSize.defaultSpace,),

            SeSectionHeading(title: 'Profile informaton'.capitalize!, showActionButton: false,),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),

            SeProfileMenu(title: 'Name:', value: controller.user.value.fullName.capitalize!, onPressed: () => Get.offAll(()=> const UpdateName()),),
            SeProfileMenu(title: 'username:', value: controller.user.value.email, onPressed: (){},),


            const SizedBox(height: SecuriteSize.defaultSpace / 2,),
            const Divider(),
            const SizedBox(height: SecuriteSize.defaultSpace,),

            SeSectionHeading(title: 'personal informaton'.capitalize!, showActionButton: false,),
            const SizedBox(height: SecuriteSize.spaceBtwItem,),

            SeProfileMenu(title: 'user ID:', value: controller.user.value.id, icon: Iconsax.copy, onPressed: (){},),
            SeProfileMenu(title: 'e-mail:', value: controller.user.value.email, onPressed: (){},),
            SeProfileMenu(title: 'phone number:', value: controller.user.value.phoneNumber, onPressed: (){},),
            SeProfileMenu(title: 'gender:', value: '', onPressed: (){},),
            SeProfileMenu(title: 'date of brth:', value: '12 oct 1991', onPressed: (){},),
            
          ],
        ),
        ),
      ),
    );
  }
}

