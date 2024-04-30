// // review_repository.dart
// import 'package:cloud_firestore/cloud_firestore.dart';


// class ReviewRepository {
//   final CollectionReference _reviewsCollection =
//       FirebaseFirestore.instance.collection('reviews');

//   Future<List<ReviewModel>> getReviewsByRequestId(String requestId) async {
//     QuerySnapshot snapshot = await _reviewsCollection
//         .where('requestId', isEqualTo: requestId)
//         .get();
//     return snapshot.docs.map((doc) {
//       return ReviewModel(
//         id: doc.id,
//         userId: doc['userId'],
//         requestId: doc['requestId'],
//         rating: doc['rating'].toDouble(),
//         comment: doc['comment'],
//         timestamp: doc['timestamp'],
//       );
//     }).toList();
//   }
// }