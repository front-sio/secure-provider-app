import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  final String id;
  final String name;
  final String image;
  final bool isFeatured;
  final String? parentId;
 

  Service({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured = false,
    this.parentId,

  });

  factory Service.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Service(
      id: snapshot.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      parentId: data['parentId'] ?? '',
      isFeatured: data['isFeatured'] ?? false,
    );
  }
}
