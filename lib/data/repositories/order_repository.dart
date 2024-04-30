// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:secureprovider/data/repositories/authentication/authentication_repository.dart';
// import 'package:secureprovider/inlyfe/models/service_request.dart';

// class OrderRepository extends GetxController {
//   static OrderRepository get instance => Get.find();


//  final _db = FirebaseFirestore.instance; 


//   Future<List<ServiceRequest>> fetchUserOrders() async {
//     try {
//       final userId = AuthenticationRepository.instance.currentUser!.uid;
//       if(userId.isEmpty) throw 'Unable to find user information. Try again in a few minutes.';
//       final result = await _db.collection('Users').doc(userId).collection('ServiceRequests').get();

//       return null;


//     }catch (e){
//       return [];
//     }
//   }
// }