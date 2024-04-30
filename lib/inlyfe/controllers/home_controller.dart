import 'package:get/get.dart';
import 'package:secureprovider/inlyfe/models/provider.dart';
import 'package:secureprovider/data/repositories/provider_repository.dart';



class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  final carouselCurentIndex = 0.obs;

  final ProviderRepository _providerRepository = ProviderRepository();

  final providers = <Provider>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProviders();
  }

  void updatePageIndicator(index) {
    carouselCurentIndex.value = index;
  }

 

  void loadProviders() {
    _providerRepository.getProviders().listen((providerList) {
      providers.assignAll(providerList);
    });
  }

}
