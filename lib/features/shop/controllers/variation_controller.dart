import 'package:e_shop/features/shop/controllers/image_controller.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/features/shop/models/product_variation.dart';
import 'package:get/get.dart';

class VariationController extends GetxController{
  static VariationController get instance => Get.find();
  RxMap selectedAttributes={}.obs;
  RxString variationStockStatus=''.obs;
  Rx<ProductVariationModel> selectedVariation=ProductVariationModel.empty().obs;
  void onAttributeSelected(ProductModel product,attributeName,attributeValue){
 final selectedAttributes=Map<String,dynamic>.from(this.selectedAttributes);
 selectedAttributes[attributeName]=attributeValue;
 this.selectedAttributes[attributeName]=attributeValue;
 final selectedVariation=product.productVariations!.firstWhere((element) => _isSameAttributeValues(element.attributeValues, selectedAttributes),orElse: ()=> ProductVariationModel.empty());
if(selectedVariation.image.isNotEmpty){
  ImagesController.instance.selectedProductImage.value=selectedVariation.image;
}
this.selectedVariation.value=selectedVariation;
  }
  bool _isSameAttributeValues(Map<String,dynamic>variationAttributes,Map<String,dynamic>selectedAttributes){
    if(variationAttributes.length!=selectedAttributes.length) return false;
    for(final key in variationAttributes.keys){
      if(variationAttributes[key]!=selectedAttributes[key]) return false;
    }
    return true;

  }
  Set<String?> getAttributesAvailabilityInVariation(List<ProductVariationModel>variations,String attributeName){
    final availableVariationAteributeValues=variations.where((element) => element.attributeValues[attributeName]!=null && element.attributeValues[attributeName]!.isNotEmpty && element.stock>0).map((e) => e.attributeValues[attributeName]).toSet();
    return availableVariationAteributeValues;

  }
  String getVariationPrice(){
    return (selectedVariation.value.salePrice>0?selectedVariation.value.salePrice:selectedVariation.value.price).toString();
  }
  void getProductVariationStockStatus(){
    variationStockStatus.value=selectedVariation.value.stock>0?'In Stock':'Out Stock';
  }
  void resetSelectedAttributes(){
    selectedAttributes.clear();
    variationStockStatus.value='';
    selectedVariation.value=ProductVariationModel.empty();
  }
}