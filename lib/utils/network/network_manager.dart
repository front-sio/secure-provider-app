import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/loader/loader.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

 void _updateConnectionStatus(List<ConnectivityResult> results) {
  // Check if any of the results indicate a connection
  final isConnected = results.contains(ConnectivityResult.mobile) ||
                      results.contains(ConnectivityResult.wifi);

  // Update connection status
  if (isConnected) {
    _connectionStatus.value = ConnectivityResult.mobile;
  } else {
    _connectionStatus.value = ConnectivityResult.none;
    SeLoader.warningSnackBar(title: 'No internet connection'.capitalize!);
  }
}


  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
