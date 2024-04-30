import 'package:flutter/material.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:secureprovider/inlyfe/screens/services/widgets/service_card.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class SeServiceShowCase extends StatelessWidget {
  const SeServiceShowCase({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SeRoundedContainer(
      showBorder: true,
      borderColor: SecuriteColors.darkGrey,
      padding: const EdgeInsets.all(SecuriteSize.md),
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: SecuriteSize.spaceBtwItem),
      child: Column(
        children: [
          const ServiceCard(showBorder: false),
          Row(
            children: images.map((image) => serviceToProviderImageWidget(image, context)).toList(),
          ),
        ],
      ),
    );
  }
}

Widget serviceToProviderImageWidget(String image, context) {
  return Expanded(
    child: SeRoundedContainer(
      height: 100,
      padding: const EdgeInsets.all(SecuriteSize.sm),
      backgroundColor: SecuriteHelperFunction.isDarkMode(context) ? SecuriteColors.darkerGrey : SecuriteColors.light,
      child: Image(
        fit: BoxFit.contain,
        image: AssetImage(image),
      ),
    ),
  );
}
