import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../inlyfe/models/service.dart';


class ServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static ServiceRepository get instance => Get.find();

  // Get all services
  Stream<List<Service>> getServices() {
    return _firestore.collection('Services').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Service.fromSnapshot(doc)).toList();
    });
  }

  Future<List<Service >?>getSubServices(String serviceId) async{
    try {
      final snapshot = await _firestore.collection('Services').where('parentId', isEqualTo: serviceId).get();
      final result = snapshot.docs.map((e) => Service.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch(e){
      throw e.toString();
    }catch (e){
      throw 'Something went wrong';
    }
  }

}
