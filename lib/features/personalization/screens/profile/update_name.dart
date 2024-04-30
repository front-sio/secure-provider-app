import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/utils/constants/size.dart';


class UpdateName extends StatelessWidget {
  const UpdateName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SeAppBar(showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: SecuriteSize.spaceBtwSection),
                  child: Column(children: [
                     TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct)),
                      ),
                      const SizedBox(height: 16,),
                      TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct)),
                      ),
                  ],),
                  )
                )
            ],
          ),
        ),
      ),
    );
  }
}