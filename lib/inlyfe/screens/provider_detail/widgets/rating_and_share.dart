import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SeRatingAndShare extends StatelessWidget {
  const SeRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(Iconsax.star5, color: Colors.amber, size: 24,),
      SizedBox(width: SecuriteSize.spaceBtwItem / 2,),
    
      Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '4.5', style: Theme.of(context).textTheme.bodyLarge),
            const TextSpan(text: '(123)')
          ]
        )
      ),
    
      // share button
      IconButton(onPressed: (){}, icon: const Icon(Icons.share, size: SecuriteSize.iconMd,)),
    ],);
  }
}