import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:secureprovider/common/widgets/loader/shimmer_effect.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/size.dart';
import '../../../utils/helpers/helper_functions.dart';

class SeCircularImage extends StatelessWidget {
  const SeCircularImage({
    super.key,
    this.fit = BoxFit.cover, 
    required this.image, 
    this.isNetworkImage = false, 
    this.overlayColor , 
    this.backgroundColor , 
    this.width = 56, 
    this.height = 56, 
    this.padding = SecuriteSize.sm,  this.radius = 75,
  });


  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding, radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      // padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??( SecuriteHelperFunction.isDarkMode(context) ? SecuriteColors.black :SecuriteColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
    
      // child: CircleAvatar(
      //   radius: radius,
      //   backgroundImage: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
      //   backgroundColor: overlayColor,
      //   ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage 
          ? CircleAvatar(
            maxRadius: width,
            backgroundImage: NetworkImage(image),
          )
            : CircleAvatar(
              radius: width,
            backgroundImage: AssetImage(image),
          ),
        ),
      ),


      
    );
  }
}