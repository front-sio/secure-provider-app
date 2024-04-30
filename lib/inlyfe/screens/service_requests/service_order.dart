
import 'package:flutter/material.dart';
import 'package:secureprovider/common/widgets/appbar/appbar.dart';
import 'package:secureprovider/inlyfe/screens/service_requests/widgets/order_list_items.dart';
import 'package:secureprovider/utils/constants/size.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeAppBar(title: Text('My Requests', style: Theme.of(context).textTheme.headlineSmall,),),
      body: const Padding(
        padding: EdgeInsets.all(SecuriteSize.defaultSpace),

        // requests
        child: SeRequestListItems(),
        ),
    );
  }
}