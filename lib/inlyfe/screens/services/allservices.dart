import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/common/widgets/providers/provider_horizontal_card.dart';
import 'package:secureprovider/inlyfe/controllers/service_controller.dart';
import 'package:secureprovider/inlyfe/models/provider.dart';
import 'package:secureprovider/utils/constants/size.dart';

class AllServices extends StatelessWidget {
  const AllServices({Key? key, required this.title, required this.providers})
      : super(key: key);

  final String title;
  final List<Provider> providers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeAppBar(title: Text(title), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SecuriteSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Heading
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      SeProviderCardHorizontal(provider: providers[index]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
