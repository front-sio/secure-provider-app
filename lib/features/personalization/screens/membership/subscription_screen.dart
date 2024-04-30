import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secureprovider/features/personalization/controllers/membership_controller.dart';

class MembershipPlanScreen extends StatelessWidget {
  final MembershipPlanController membershipPlanController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership Plan'),
      ),
      body: Center(
        // Implement your membership plan selection UI here
      ),
    );
  }
}