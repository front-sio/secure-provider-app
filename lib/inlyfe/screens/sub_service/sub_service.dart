import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/common/widgets/images/se_rounded_image.dart';
import 'package:secureprovider/common/widgets/loader/shimmer_effect.dart';
import 'package:secureprovider/common/widgets/providers/provider_horizontal_card.dart';
import 'package:secureprovider/common/widgets/text/section_heading.dart';
import 'package:secureprovider/inlyfe/controllers/service_controller.dart';
import 'package:secureprovider/inlyfe/models/service.dart';
import 'package:secureprovider/inlyfe/screens/services/allservices.dart';
import 'package:secureprovider/utils/constants/size.dart';
import 'package:secureprovider/utils/helpers/cloud_helper.dart';

class SubServices extends StatelessWidget {
  const SubServices({Key? key, required this.service}) : super(key: key);

  final Service service;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceController());
    return Scaffold(
      appBar: SeAppBar(
        title: Text(service.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner Image
            const SeRoundedImage(
              imageUrl: 'assets/services/services.jpg',
              applyImageRadius: true,
            ),
            const SizedBox(height: SecuriteSize.spaceBtwSection),
            // Sub-Services
            FutureBuilder<List<Service>?>(
                future: controller.getSubServices(service.id),
                builder: (context, AsyncSnapshot<List<Service>?> snapshot) {
                  const loader = SeShimmerEffect(width: 300, height: 100);

                  final widget = SeCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                  if (widget != null) return widget;

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Sub-Services Found!'));
                  }

                  final subServices = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: subServices.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {

                      final subService = subServices[index];


                      return FutureBuilder(
                        future: controller.getServiceProviders(serviceId: subService.id),
                        builder: (context, snapshot) {

                          const loader = SeShimmerEffect(width: 300, height: 100);

                          final widget = SeCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);
                          if (widget != null) return widget;

                          final providers = snapshot.data!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Section Heading
                              SeSectionHeading(
                                title: subService.name.capitalize!,
                                onPressed: () {},
                              ),
                              const SizedBox(height: SecuriteSize.spaceBtwItem / 2),
                              // List of Providers
                              SizedBox(
                                height: 120,
                                child: ListView.separated(
                                  itemCount: providers.length,
                                  separatorBuilder: (context, index) =>
                                    const SizedBox(width: SecuriteSize.spaceBtwItem),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                    SeProviderCardHorizontal(provider: providers[index],),
                                ),
                              ),
                            ],
                          );
                        }
                      );
                    },
                  );
                },
              )


          ],
        ),
      ),
    );
  }
}
