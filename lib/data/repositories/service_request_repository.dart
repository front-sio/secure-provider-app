import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../inlyfe/models/service_request.dart';

class ServiceRequestRepository {
  
  static ServiceRequestRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> sendServiceRequest(ServiceRequest request) async {
    try {
      // Create a new document in the 'service_requests' collection
      await _firestore.collection('Service_requests').add(request.toMap());
      
      // Return true indicating that the request was successfully sent
      return true;
    } catch (e) {
      // Handle errors, e.g., log or throw an exception
      print('Error sending service request: $e');
      return false;
    }
  }

Stream<List<ServiceRequest>> getServiceRequests() {
  return _firestore.collection('Service_requests').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => ServiceRequest.fromMap(doc.id, doc.data())).toList();
  });
}

}
