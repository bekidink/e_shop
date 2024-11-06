import 'package:e_shop/data/repositories/products/product_repo.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/utils/constants/enums.dart';
import 'package:e_shop/utils/loaders/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();
  final isLoading=false.obs;
  final productRepository=Get.put(ProductRepository());
  RxList<ProductModel> featureProducts=<ProductModel>[].obs;
  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts()async{
    try{
      isLoading.value=true;
      final products=await productRepository.getFeaturedProducts();
      featureProducts.assignAll(products);
      isLoading.value=false;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh',message: e.toString());
      isLoading.value=false;
    }
  }
  Future<List<ProductModel>> fetchFeaturedAllProducts()async{
    try{
      isLoading.value=true;
      final products=await productRepository.getFeaturedAllProducts();
      
      isLoading.value=false;
      return products;
    }catch(e){
      TLoaders.errorSnackBar(title: 'Oh',message: e.toString());
      isLoading.value=false;
      return[];
    }
  }
  String getProductPrice(ProductModel product){
    double smPrice=double.infinity;
    double lgPice=0.0;
    if(product.productType==ProductType.single.toString()){
      return (product.salePrice>0?product.salePrice:product.price).toString();
    }
    else{
      for(var variation in product.productVariations!){
        double priceToConsider=variation.salePrice>0.0?variation.salePrice:variation.price;
        if(priceToConsider<smPrice){
          smPrice=priceToConsider;
        }
        if(priceToConsider>lgPice){
          lgPice=priceToConsider;
        }
      }
      if(smPrice.isEqual(lgPice)){
        return lgPice.toString();
      }else{
        return '$smPrice - \$$lgPice';
      }
    }
  }
  String? calculateSalePercentage(double originalPrice,double? salePrice){
    if(salePrice==null || salePrice <=0.0) return null;
    if(originalPrice<=0) return null;
    double percentage=((originalPrice-salePrice)/originalPrice)*100;
    return percentage.toStringAsFixed(0);
  }
  String getProductStockStatus(int stock){
    return stock>0?'In Stock':'Out of Stock';
  }
}