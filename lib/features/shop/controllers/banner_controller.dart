import 'package:e_shop/data/repositories/banners/banner_repo.dart';
import 'package:get/get.dart';

import '../../../utils/loaders/loaders.dart';
import '../models/banner_model.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();
  final carouselCurrentIndex=0.obs;
    final bannerRepository=Get.put(BannerRepository());
  RxList<BannerModel> allBanners=<BannerModel>[].obs;
  RxList<BannerModel> featuredCategories=<BannerModel>[].obs;
  final isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners()async{
    try{
      isLoading.value=true;
      final banners=await bannerRepository.getAllBanners();
      allBanners.assignAll(banners);
      isLoading.value=false;
    }catch(e){
      isLoading.value=false;
      TLoaders.errorSnackBar(title: 'Oh Error',message: e.toString());
    }}
  void updatePageIndicator(index){
    carouselCurrentIndex.value=index;
  }
}