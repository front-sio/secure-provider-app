import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/text/service_title.dart';
import 'package:secureprovider/utils/constants/enums.dart';
import 'package:secureprovider/utils/constants/size.dart';


class SeServiceTitleTextWithVerifedIcon extends StatelessWidget {
  const SeServiceTitleTextWithVerifedIcon({
    super.key, 
    required this.title, 
    this.maxLines = 1, 
    this.textColor, 
    this.iconColor = Colors.blue, 
    this.textAlign = TextAlign.center,
    this.serviceTextSize = TextSizes.small,
    });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes serviceTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Row(
            children: [
              Flexible(
                child: SeServiceTitle(
                  title: title,
                  color: textColor,
                  maxLines: maxLines,
                  textAlign: textAlign,
                  serviceTextSize: serviceTextSize,
                ),
              ),
              const SizedBox(width: SecuriteSize.md,),
              Icon(Iconsax.verify, color: iconColor, size: SecuriteSize.iconMd,)
            ],
          )
        )
      ],
    );
  }
}

