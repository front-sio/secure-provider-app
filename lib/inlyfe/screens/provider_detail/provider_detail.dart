import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:secureprovider/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:secureprovider/common/widgets/images/se_circular_image.dart';
import 'package:secureprovider/common/widgets/text/se_service_title_text_with_verified_icon.dart';
import 'package:secureprovider/common/widgets/text/section_heading.dart';
import 'package:secureprovider/inlyfe/screens/provider_detail/widgets/rating_and_share.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

import '../../controllers/service_request_controller.dart';

class ProviderDetailScreen extends StatelessWidget {
  final String providerId;
  final String service;
  final String providerName;
  final String providerType;
  final double rating;
  ProviderDetailScreen({super.key, required this.providerId, required this.service, required this.providerName, required this.providerType, required this.rating});

  final ServiceRequestController _controller = Get.put(ServiceRequestController());

  @override
  Widget build(BuildContext context) {
    final dark = SecuriteHelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SeCurvedEdges(
              child: Container(
                color: dark ? SecuriteColors.grey : SecuriteColors.light,
                child:  Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: SecuriteSize.spaceBtwSection,),
                        SizedBox(height: 150, child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: SeCircularImage(backgroundColor: dark ? SecuriteColors.black : SecuriteColors.white, width: 100, height: 100, radius: 75, image: 'assets/services/services (11).jpg')),
                        )),
                        Text(providerName!.capitalize!, style: Theme.of(context).textTheme.headlineMedium,),
                        const SizedBox(height: SecuriteSize.spaceBtwSection,),
                      ],
                    ),

                  ],
                ),
              ),
              ),


              // provider detail
              Padding(
                padding: const EdgeInsets.only(right: SecuriteSize.defaultSpace, left: SecuriteSize.defaultSpace, bottom: SecuriteSize.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // rating and sharing
                    const SeRatingAndShare(),

                    SeServiceTitleTextWithVerifedIcon(title: service, iconColor: SecuriteHelperFunction.isDarkMode(context) ? SecuriteColors.light : SecuriteColors.black,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(providerType!.capitalize!, ),
                        const SizedBox(height: SecuriteSize.spaceBtwItem ,),
                        const SizedBox(height: SecuriteSize.spaceBtwSection / 2,),
                      ],
                    ),

                    const Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SeSectionHeading(title: 'Reviews (123)', showActionButton: true,),
                        IconButton(icon: const Icon(Iconsax.arrow_right, size: 18), onPressed: (){},),

                      ],
                    ),

                    const Divider(),

                    
                    const SeSectionHeading(title: 'About'),
                    const ReadMoreText(
                      'Provider about description goes here on this demo now, Provider about description goes here on this demo now, Provider about description goes here on this demo now',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    ),

                    const SizedBox(height: SecuriteSize.spaceBtwSection,),

                    SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){
                      _controller.sendServiceRequest(providerId, service, providerName);
                    }, child: const Text('Request')))
                  ],
                ),
                )
          ],
        ),
      ),
    );
  }
}

