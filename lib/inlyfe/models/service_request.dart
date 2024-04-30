import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ServiceRequest {
  final String? id;
  final String providerId;
  final String userId;
  final String serviceId;
  final String status;
  final String? address;
  final String providerName;
  final DateTime requestTime;

  ServiceRequest({
    this.id,
    required this.providerId,
    required this.userId,
    required this.serviceId,
    required this.status,
    required this.address,
    required this.providerName,
    required this.requestTime,
  });

  // Factory constructor to create a ServiceRequest from a map
  factory ServiceRequest.fromMap(String documentId, Map<String, dynamic> map) {
    return ServiceRequest(
      id: documentId,
      providerId: map['providerId'] ?? '',
      userId: map['userId'] ?? '',
      serviceId: map['serviceId'] ?? '',
      status: map['status'] ?? '',
      address: map['address'] ?? '',
      providerName: map['providerName'] ?? '',
      requestTime: DateTime.parse(map['requestTime'] ?? ''),
    );
  }


  // Method to convert ServiceRequest to a map
  Map<String, dynamic> toJson() {
    return {
      'providerId': providerId,
      'userId': userId,
      'serviceId': serviceId,
      'status': status,
      'address': address,
      'providerName': providerName,
      'requestTime': requestTime.toIso8601String(),
    };
  }

  // Method to convert ServiceRequest to a map
  Map<String, dynamic> toMap() {
    return {
      'providerId': providerId,
      'userId': userId,
      'serviceId': serviceId,
      'status': status,
      'address': address,
      'providerName': providerName,
      'requestTime': requestTime.toIso8601String(),
    };
  }

  // factory ServiceRequest.fromSnapshot(DocumentSnapshot snapshot){
  //   final data = snapshot.data() as Map<String, dynamic>;

  //   return ServiceRequest(
  //     providerId: data['providerId'] as String, 
  //     userId: data['userId'] as String, 
  //     serviceId: data['serviceId'] as String, 
  //     status: data['status'] as String, 
  //     address: AddressModel.fromMap(data['providerId'] as Map<String, dynamic>), 
  //     providerName: data['providerName'] as String, 
  //     requestTime: data['providerId'] == null ? null : (data['requestTime'] as Timestamp).toDate(),
  //     );
  // }
}

class AdressModel {
}
