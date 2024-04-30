import 'package:cloud_firestore/cloud_firestore.dart';

class Provider {
  final String id;
  final String name;
  final String thumbnail;
  final String type;
  final String service;
  final double rating;
  final bool isVerified;

  Provider({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.type,
    required this.service,
    required this.rating,
    required this.isVerified,
  });

  factory Provider.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return Provider(
      id: snapshot.id,
      name: data['name'] ?? '',
      thumbnail: data['thumbnail'] ?? '',
      type: data['providerType'] ?? '',
      service: data['providerService'] ?? '',
      isVerified: data['isVerified'] ?? false,
      rating: double.tryParse(data['rate'] ?? '0.0') ?? 0.0,
    );
  }
}
