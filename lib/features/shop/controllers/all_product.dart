import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_shop/data/repositories/products/product_repo.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController{
  static AllProductsController get instance => Get.find();
 final repository=ProductRepository.instance;
 final RxString selectedSortOption='Name'.obs;
 RxList<ProductModel> products=<ProductModel>[].obs;
  Future<List<ProductModel>> fetchProductsByQuery(Query? query)async{
    try{
 if(query==null) return [];
final products=await repository.getFeaturedProductsByQuery(query);
return products;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption){
    selectedSortOption.value=sortOption;
    switch(sortOption){
      case 'Name':
          products.sort((a,b)=>a.title.compareTo(b.title));
          break;
      case 'Higher Price':
          products.sort((a,b)=>b.price.compareTo(a.price));
          break;
      case 'Lower Price':
          products.sort((a,b)=>a.price.compareTo(b.price));
          break;
      case 'Newest':
          products.sort((a,b)=>a.date!.compareTo(b.date!));
          break;
      case 'Sale':
          products.sort((a,b){
          if(b.salePrice>0){
            return b.salePrice.compareTo(a.salePrice);
          }else if(a.salePrice>0){
            return -1;
          }else{
            return 1;
          }
          });
          break;
      default:
        products.sort((a,b)=>a.title.compareTo(b.title));
      
    }
  }
  void assignProducts(List<ProductModel>products){
    this.products.assignAll(products);
    sortProducts('Name');
  }
}