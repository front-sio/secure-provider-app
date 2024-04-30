import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:secureprovider/features/personalization/screens/address/add_new_address.dart';
import 'package:secureprovider/features/personalization/screens/address/widgets/single_address.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: SecuriteColors.primary,
        onPressed: () => Get.to(()=> const AddNewAddressScreen()),
        child: const Icon(Iconsax.add,  color: Colors.white,),
        ),

        appBar: SeAppBar(
          showBackArrow: true,
          title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,),
          ),


          body: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(SecuriteSize.defaultSpace),
              child: Column(
                children: [
                    SeSingleAdress(selectedAdress: false,),
                    SeSingleAdress(selectedAdress: true,),
                ],
              ),
            ),
          ),
    );
  }
}