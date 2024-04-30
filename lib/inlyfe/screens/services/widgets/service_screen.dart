import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:secureprovider/common/layouts/grid_layout_view.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/common/widgets/appbar/tabbar.dart';
import 'package:secureprovider/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:secureprovider/common/widgets/text/section_heading.dart';
import 'package:secureprovider/inlyfe/screens/services/widgets/service_card.dart';
import 'package:secureprovider/inlyfe/screens/services/widgets/service_showcase.dart';
import 'package:secureprovider/utils/constants/colors.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/helper_functions.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: SeAppBar(
          title: Text(
            'Services',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: SecuriteHelperFunction.isDarkMode(context)
                    ? SecuriteColors.dark
                    : SecuriteColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(SecuriteSize.spaceBtwItem),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Searchbar
                      const SizedBox(height: SecuriteSize.spaceBtwItem),
                      const SeSearchContainer(
                        icon: Iconsax.search_normal,
                        text: 'Search here...',
                        showBackground: false,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: SecuriteSize.spaceBtwSection),

                      // Heading
                      SeSectionHeading(title: 'Featured Services', onPressed: () {}),
                      const SizedBox(height: SecuriteSize.spaceBtwItem / 1.5),

                      // Service cards
                      SeGridLayoutView(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) => const ServiceCard(showBorder: false),
                      ),
                    ],
                  ),
                ),

                // Services tab
                bottom: const SeTabBar(
                  tabs: [
                    Tab(child: Text('Salon')),
                    Tab(child: Text('Salon')),
                    Tab(child: Text('Salon')),
                    Tab(child: Text('Salon')),
                    Tab(child: Text('Salon')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(SecuriteSize.defaultSpace),
                child: Column(
                  children: [
                    // services
                    SeServiceShowCase(
                      images: [
                        'assets/services/services (6).jpg',
                        'assets/services/services (8).jpg',
                        'assets/services/services (7).jpg',
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SecuriteSize.defaultSpace),
                child: Column(
                  children: [
                    // services
                    SeServiceShowCase(
                      images: [
                        'assets/services/services (6).jpg',
                        'assets/services/services (8).jpg',
                        'assets/services/services (7).jpg',
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SecuriteSize.defaultSpace),
                child: Column(
                  children: [
                    // services
                    SeServiceShowCase(
                      images: [
                        'assets/services/services (6).jpg',
                        'assets/services/services (8).jpg',
                        'assets/services/services (7).jpg',
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SecuriteSize.defaultSpace),
                child: Column(
                  children: [
                    // services
                    SeServiceShowCase(
                      images: [
                        'assets/services/services (6).jpg',
                        'assets/services/services (8).jpg',
                        'assets/services/services (7).jpg',
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SecuriteSize.defaultSpace),
                child: Column(
                  children: [
                    // services
                    SeServiceShowCase(
                      images: [
                        'assets/services/services (6).jpg',
                        'assets/services/services (8).jpg',
                        'assets/services/services (7).jpg',
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
