// membership_plan_controller.dart
import 'package:get/get.dart';

class MembershipPlanController extends GetxController {
  static MembershipPlanController get instance => Get.find();
  RxList<MembershipPlan> _plans = <MembershipPlan>[].obs;
  Rx<MembershipPlan> _selectedPlan = MembershipPlan(name: '', price: 0.0, duration: 0).obs;

  List<MembershipPlan> get plans => _plans.value;
  MembershipPlan get selectedPlan => _selectedPlan.value;

  set selectedPlan(MembershipPlan plan) => _selectedPlan.value = plan;

  void fetchPlans() {
    // Implement logic to fetch available membership plans from backend
    // Update _plans list with fetched plans
  }

  void subscribe() {
    // Implement logic to subscribe user to selected plan
    // This might involve making a payment, updating user status, etc.
  }
}

class MembershipPlan {
  final String name;
  final double price;
  final int duration;

  MembershipPlan({required this.name, required this.price, required this.duration});
}
