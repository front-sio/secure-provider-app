import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/inlyfe/controllers/service_controller.dart';
import 'package:secureprovider/inlyfe/screens/sub_service/sub_service.dart';

import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';

class SeHomeServices extends StatelessWidget {
  const SeHomeServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServiceController controller = Get.put(ServiceController());
    return Obx(
      () {
        if (controller.featuredServices.isEmpty) {
          return Text(
            'No Data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          );
        }

        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredServices.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final service = controller.featuredServices[index];
              return FutureBuilder<bool>(
                future: _isConnected(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show loading indicator while checking network connectivity
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    // Show error message if an error occurred while checking network connectivity
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final isConnected = snapshot.data!;
                    // Conditionally show image based on network connectivity
                    return isConnected
                        ? SeVerticalImageText(
                            title: service.name,
                            imageUrl: service.image,
                            backgroundColor: Colors.white,
                            onTap: () => Get.to(() => SubServices(service: service)),
                          )
                        : Text('No network');
                  }
                },
              );
            },
          ),
        );
      },
    );
  }

  Future<bool> _isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
