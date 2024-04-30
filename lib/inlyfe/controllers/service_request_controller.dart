import 'package:get/get.dart';
import 'package:secureprovider/inlyfe/models/service.dart';
import 'package:secureprovider/inlyfe/models/provider.dart';

import '../../data/repositories/service_request_repository.dart';
import '../../features/authentication/screens/password_configuration/success_screen.dart';
import '../models/service_request.dart';

class ServiceRequestController extends GetxController {
  static ServiceRequestController get instance => Get.find();

   // Define _serviceRequestRepository
  final ServiceRequestRepository _serviceRequestRepository = ServiceRequestRepository();

  final services = <Service>[].obs;
  final providers = <Provider>[].obs;
  final requests = <ServiceRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadRequests();
  }

  Future<void> sendServiceRequest(String providerId, String providerName, String serviceId) async {
    final request = ServiceRequest(
      providerId: providerId,
      serviceId: serviceId,
      requestTime: DateTime.now(), 
      status: 'pending', 
      address: '', 
      providerName: providerName, 
      userId: '',
    );

   

    final success = await _serviceRequestRepository.sendServiceRequest(request);
    if (success) {
      // Request was successful, navigate to success screen
      Get.off(() => SuccessScreen(image: 'assets/services/services.jpg', title: 'Request Sent', subtitle: 'Congratulations! your service request sent successfully.', onPressed: () {},));
    } else {
      // Request failed, handle accordingly (e.g., show error message)
    }
  }


  void loadRequests() {
    _serviceRequestRepository.getServiceRequests().listen((requestList) {
      requests.assignAll(requestList);
    });
  }
}
