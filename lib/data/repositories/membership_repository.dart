import 'package:cloud_firestore/cloud_firestore.dart';

class SubscriptionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to subscribe user to become a service provider
  Future<void> subscribeToProvider(String userId) async {
    try {
      // Perform the necessary actions to subscribe the user
      await _firestore.collection('Providers').doc(userId).set({
        'subscribedAt': DateTime.now(),
      });
    } catch (e) {
      // Handle any errors that occur during the subscription process
      throw 'Failed to subscribe user as a service provider: $e';
    }
  }

  // Method to unsubscribe user from being a service provider
  Future<void> unsubscribeFromProvider(String userId) async {
    try {
      // Perform the necessary actions to unsubscribe the user
      await _firestore.collection('providers').doc(userId).delete();
    } catch (e) {
      // Handle any errors that occur during the unsubscription process
      throw 'Failed to unsubscribe user from being a service provider: $e';
    }
  }

  // Method to check if user is subscribed as a service provider
  Future<bool> isUserSubscribed(String userId) async {
    try {
      // Check if the user exists in the 'providers' collection
      final docSnapshot = await _firestore.collection('Providers').doc(userId).get();
      return docSnapshot.exists;
    } catch (e) {
      // Handle any errors that occur during the check
      throw 'Failed to check user subscription status: $e';
    }
  }
}
