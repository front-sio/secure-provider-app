import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/utils/constants/size.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SeAppBar(showBackArrow: true, title: Text('Add New Address'),),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
            child: Form(
              child: Column(
                children: [
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name'),),
                  const SizedBox(height: SecuriteSize.spacingBtwInputFields,),
                  TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone Number'),),
                  const SizedBox(height: SecuriteSize.spacingBtwInputFields,),
                  Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street'),)),
                      const SizedBox(width: SecuriteSize.spacingBtwInputFields,),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code'),)),
                    ],
                    ),
                    const SizedBox(height: SecuriteSize.spacingBtwInputFields,),

                     Row(
                    children: [
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City'),)),
                      const SizedBox(width: SecuriteSize.spacingBtwInputFields,),
                      Expanded(child: TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State'),)),
                    ],
                    ),
                    const SizedBox(height: SecuriteSize.spacingBtwInputFields,),
                    TextFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.global), labelText: 'Country'),),

                ]
              ),
            ),
          ),
      ),
    );
  }
}