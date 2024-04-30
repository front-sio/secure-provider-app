import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/loader/loader.dart';
import 'package:secureprovider/data/repositories/user/user_repository.dart';
import 'package:secureprovider/features/personalization/models/user_model.dart';

class UserController extends GetxController {
  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  static UserController get instance => Get.find();
  final UserRepository userRepository = UserRepository.instance;

  @override
  void onInit(){
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
      try {
        profileLoading.value = true;
        final user = await userRepository.fetchUserDetails();
        this.user(user); 
      }catch (e){
        user(UserModel.empty());
      }finally {
        profileLoading.value = false;
      }
  }


  // save user record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if(userCredentials != null){
        final nameParts = UserModel.nameParts(userCredentials.user?.displayName ?? '');
        final user = UserModel(
          id: userCredentials.user!.uid,
          firstName: nameParts[0],
          username: '',
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' '): '',
          email: userCredentials.user!.email ?? '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);
      }
    }catch (e){
      SeLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  
}
