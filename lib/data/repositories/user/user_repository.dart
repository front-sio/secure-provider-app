
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:secureprovider/data/repositories/authentication/authentication_repository.dart';


import '../../../features/personalization/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();


  final deviceStorage = GetStorage();
  final FirebaseFirestore _db = FirebaseFirestore.instance;



// save user data in the database

Future<void> saveUserRecord(UserModel user) async{
    try {
      return await _db.collection('Users').doc(user.id).set(user.toJson());
    }on FirebaseException catch (e){
      throw e.code;
    }
    catch (e){
      throw 'Something went erong, Please try again';
    }
  }


  // function to fetch user details based on the user ID

  Future<UserModel> fetchUserDetails() async{
    try {
      final documentSnapshot = await _db.collection('Users').doc(AuthenticationRepository.instance.currentUser?.uid).get();
      if (documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else {
        return UserModel.empty();
      }
    }on FirebaseException catch (e){
      throw e.code;
    }
    catch (e){
      throw 'Something went erong, Please try again';
    }
  }

  // update user information in firebase

  Future<void> updateUserDetails(UserModel updatedUser) async{
    try {
      await _db.collection('Users').doc(updatedUser.id).update(updatedUser.toJson());
      
    }on FirebaseException catch (e){
      throw e.code;
    }
    catch (e){
      throw 'Something went erong, Please try again';
    }
  }

// update any field in specific users collection
Future<void> updateSingleField(Map<String, dynamic> json) async{
    try {
      await _db.collection('Users').doc().update(json);
      
    }on FirebaseException catch (e){
      throw e.code;
    }
    catch (e){
      throw 'Something went erong, Please try again';
    }
  }


// function to remove user data from firestore

Future<void> removeUserRecord(String userId) async{
    try {
      await _db.collection('Users').doc(userId).delete();
      
    }on FirebaseException catch (e){
      throw e.code;
    }
    catch (e){
      throw 'Something went erong, Please try again';
    }
  }


// Upload any image


}