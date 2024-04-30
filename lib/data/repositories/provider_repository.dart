import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../inlyfe/models/provider.dart';

class ProviderRepository {
  static ProviderRepository get instance => Get.find();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get all providers
  Stream<List<Provider>> getProviders() {
    return _firestore.collection('Providers').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Provider.fromSnapshot(doc)).toList();
    });
  }

  Future<List<Provider>?> getProviderForService({required String serviceId, int limit = 4}) async {
    try {
      QuerySnapshot providerServiceQuery  = limit == -1
      ? await _firestore.collection('providerServices').where('serviceId', isEqualTo: serviceId).get()
      : await _firestore.collection('providerServices').where('serviceId', isEqualTo: serviceId).limit(limit).get();

      List<String> providerIds = providerServiceQuery.docs.map((doc) => doc['providerId'] as String).toList();
      final providersQuery = await _firestore.collection('Providers').where(FieldPath.documentId, whereIn: providerIds).get();


      List<Provider> providers = providersQuery.docs.map((doc) => Provider.fromSnapshot(doc)).toList();

      return providers;
    } on FirebaseException catch (e){
      throw e.toString();
    } catch (e){
      throw 'Something went wrong. please try again';
    }
  }
}
