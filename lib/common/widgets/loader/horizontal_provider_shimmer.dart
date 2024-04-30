import 'package:flutter/widgets.dart';
import 'package:secureprovider/common/widgets/loader/shimmer_effect.dart';
import 'package:secureprovider/utils/constants/size.dart';

class SeHorizontalProviderShimmer extends StatelessWidget {
  const SeHorizontalProviderShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SecuriteSize.spaceBtwSection),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
         
        separatorBuilder: (context, index) => const SizedBox(width: SecuriteSize.spaceBtwItem,), 
        itemBuilder: (_, __) => const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SeShimmerEffect(width: 120, height: 120),
            SizedBox(width: SecuriteSize.spaceBtwItem,),

            // text
            Column(
              children: [
                Text('')
            ],
            )

          ],
        ),
        
        ),
    );
  }
}