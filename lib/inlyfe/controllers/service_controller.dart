import 'package:get/get.dart';
import 'package:secureprovider/common/widgets/loader/loader.dart';
import 'package:secureprovider/data/repositories/provider_repository.dart';
import 'package:secureprovider/inlyfe/models/provider.dart';

import '../../data/repositories/service_repository.dart';
import '../models/service.dart';

class ServiceController extends GetxController{
  static ServiceController get instance => Get.find();

  final ServiceRepository _serviceRepository = ServiceRepository();

  RxList<Service> allServices = <Service>[].obs;
  RxList<Service> featuredServices = <Service>[].obs;
  final isLoading = false.obs;

   @override
  void onInit() {
    super.onInit();
    loadServices();
  }


   void loadServices() {
    try{

      isLoading.value = true;

       _serviceRepository.getServices().listen((serviceList) {
          allServices.assignAll(serviceList);
          featuredServices.assignAll(allServices.where((service) => service.isFeatured && service.parentId!.isEmpty).take(8).toList());
        });
      } catch (e){
        SeLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      } finally {isLoading.value = false;}
  }


  void loadSubServices() {
  try {
    isLoading.value = true;
    _serviceRepository.getServices().listen((serviceList) {
      allServices.assignAll(serviceList);
      featuredServices.assignAll(allServices.where((service) => service.isFeatured && service.parentId!.isNotEmpty).toList());
    });
  } catch (e) {
    SeLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  } finally {
    isLoading.value = false;
  }
}


  Future<List<Service>?> getSubServices(String serviceId) async {
    try {
      final subServices = await _serviceRepository.getSubServices(serviceId);
      return subServices;
    }catch (e){
      SeLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


  Future<List<Provider>?> getServiceProviders({required String serviceId, int limit = 4}) async {
    try {
      final providers = await ProviderRepository.instance.getProviderForService(serviceId: serviceId, limit: limit);
      return providers;
    }catch (e){
      SeLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}