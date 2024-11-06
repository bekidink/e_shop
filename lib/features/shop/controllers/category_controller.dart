import 'package:e_shop/data/repositories/categories/categories_repo.dart';
import 'package:e_shop/features/shop/models/category_model.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:get/get.dart';

import '../../../data/services/firebase_service.dart';

class CategoryController extends GetxController{
  static CategoryController get instance=>Get.find();
  final categoryRepository=Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories=<CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories=<CategoryModel>[].obs;
  final isLoading=false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories()async{
    try{
      isLoading.value=true;
      final categories=await categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories.where((p0) => p0.isFeatured && p0.parentId.isEmpty).take(8).toList());
      isLoading.value=false;
    }catch(e){
      isLoading.value=false;
      TLoaders.errorSnackBar(title: 'Oh Error',message: e.toString());
    }
  }
  
}