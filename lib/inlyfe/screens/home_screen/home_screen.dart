
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:secureprovider/common/widgets/providers/provider_vertical_card.dart';
import 'package:secureprovider/inlyfe/screens/home_screen/widgets/home_appbar.dart';
import 'package:secureprovider/inlyfe/screens/home_screen/widgets/home_services.dart';
import 'package:secureprovider/inlyfe/screens/home_screen/widgets/promo_slider.dart';
import 'package:secureprovider/inlyfe/screens/provider_detail/provider_detail.dart';

import '../../../common/layouts/grid_layout_view.dart';
import '../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../utils/constants/size.dart';
import '../../controllers/home_controller.dart';



class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SePrimaryHeaderContainer(
              child: Column(
                children: [
                  // appbar
                 SeHomeAppBar(),
                 SizedBox(height: SecuriteSize.spacingBtwInputFields,),

                  // searchbar
                  SeSearchContainer(text: 'Search here...', icon: Iconsax.search_normal,),
                  SizedBox(height: SecuriteSize.spacingBtwInputFields,),

                  // Services
                  Padding(
                    padding: EdgeInsets.only(left: SecuriteSize.defaultSpace,),
                    child: Column(
                      children: [
                        // heading
                        SeSectionHeading(title: 'popular services', showActionButton: false, textColor: Colors.white,),
                        SizedBox(height: SecuriteSize.spaceBtwItem,),
                        // Services
                         SeHomeServices(),

                      ],
                    ),
                    ),
                   SizedBox(height: SecuriteSize.spaceBtwSection,),
                ],
              )
              ),

              const Padding(
                padding: EdgeInsets.all(SecuriteSize.md),
                child: SePromoSlider(banners: [
                  'assets/services/services.jpg',
                  'assets/services/services.jpg',
                  'assets/services/services.jpg',
                  'assets/services/services.jpg',
                ],),
              ),
              const SizedBox(height: SecuriteSize.spaceBtwSection,),


              // heading
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: SeSectionHeading(title: 'recommended for you',),
              ),

              // provider grid layout
              const SizedBox(height: SecuriteSize.spaceBtwSection,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(()=> SeGridLayoutView(itemCount: _controller.providers.length, mainAxisExtent: 350, itemBuilder: (_ , index ) => 
                SeProviderVerticalCard(
                  image: 'assets/services/services.jpg', 
                  ratingCount: _controller.providers[index].rating,
                  providerName: _controller.providers[index].name,
                  providerType: _controller.providers[index].type,
                  providerService: _controller.providers[index].service,
                  onTap: () => Get.to(() => ProviderDetailScreen(
                    providerId: _controller.providers[index].id, 
                    providerName: _controller.providers[index].name, 
                    providerType: _controller.providers[index].type,
                    service: _controller.providers[index].service,
                    rating: _controller.providers[index].rating,
                    )),
                  ),)),
              ),
              
          ],
        ),
      ),
    );
  }
}

