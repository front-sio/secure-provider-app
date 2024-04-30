import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:secureprovider/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:secureprovider/data/repositories/authentication/authentication_repository.dart';
import 'package:secureprovider/data/repositories/user/user_repository.dart';
import 'package:secureprovider/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()));

    Get.put(UserRepository());
    runApp(const App());
}

