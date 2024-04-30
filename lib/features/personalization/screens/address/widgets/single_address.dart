import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class SeSingleAdress extends StatelessWidget {
  const SeSingleAdress({super.key, required this.selectedAdress});
  final bool selectedAdress;

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return  SeRoundedContainer(
          width: double.infinity,
          showBorder: true,
          padding: const EdgeInsets.all(SecuriteSize.md),
          borderColor: selectedAdress ? Colors.transparent : dark ? SecuriteColors.darkerGrey : SecuriteColors.grey,
          backgroundColor: selectedAdress ? SecuriteColors.primary.withOpacity(0.5) : Colors.transparent ,
          margin: const EdgeInsets.only(bottom: SecuriteSize.spaceBtwItem),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAdress ? Iconsax.tick_circle5 : null,
                  color: selectedAdress ? dark ? SecuriteColors.light : SecuriteColors.dark : null,
                  ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Masanja Joseph', 
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleLarge,
                    ),
                  const SizedBox(height: SecuriteSize.sm / 2,),
                  const Text('+255 762-232-797', overflow: TextOverflow.ellipsis,  maxLines: 1,),
                  const SizedBox(height: SecuriteSize.sm / 2,),
                  const Text('kivule ukonga, Ilala, Dsm, Tanzania', overflow: TextOverflow.ellipsis, maxLines: 1,),
                  const SizedBox(height: SecuriteSize.sm / 2,),

                ],
              ),
            ],
          ),
        );
  }
}