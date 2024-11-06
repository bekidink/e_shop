import 'package:cloud_firestore/cloud_firestore.dart';

import 'brand_model.dart';
import 'product_attributes.dart';
import 'product_variation.dart';

class ProductModel{
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
ProductModel({required this.id,required this.stock,this.sku,

required this.price,required this.title,this.date, this.salePrice=0.0,required this.thumbnail,
this.isFeatured,this.brand,this.images, this.description, this.categoryId,
required this.productType,this.productAttributes,this.productVariations

});
static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

toJson(){
  return{
    
    'Stock':stock,
    'SKU':sku,
    'Price':price,
    'Images':images,
    'Thumbnail':thumbnail,
    'SalePrice':salePrice,
    'IsFeatured':isFeatured,
    'CategoryId':categoryId,
    'Description':description,
    'ProductType':productType,
    'Brand':brand!.toJson(),
    'ProductAttributes':productAttributes!=null?productAttributes!.map((e) => e.toJson()).toList():[],
    'ProductVariations':productVariations!=null?productVariations!.map((e) => e.toJson()).toList():[]

  };
}
factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){

  final data=document.data()!;
  return ProductModel(id: document.id, stock: data['Stock']?? '', 
  price: double.parse((data['Price']??0).toString()), title: data['Title']??'', 
  thumbnail: data['Thumbnail'] ?? '', 
  images: data['Images'] !=null? List<String>.from(data['Images']):[],
  salePrice: double.parse((data['SalePrice']??0).toString()),
  sku: data['SKU']??'',description: data['Description'],
  categoryId: data['CategoryId']??'',brand: BrandModel.fromJson(data['Brand']),
  isFeatured: data['IsFeatured']??false,
  productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
  productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
  productType: data['ProductType']);
}

factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?>document){
  final data=document.data() as Map<String,dynamic>;
  return ProductModel(id: document.id, stock: data['Stock']?? '', 
  price: double.parse((data['Price']??0).toString()), title: data['Title']??'', 
  thumbnail: data['Thumbnail'] ?? '', 
  images: data['Images'] !=null? List<String>.from(data['Images']):[],
  salePrice: double.parse((data['SalePrice']??0).toString()),
  sku: data['SKU']??'',description: data['Description'],
  categoryId: data['CategoryId']??'',brand: BrandModel.fromJson(data['Brand']),
  isFeatured: data['IsFeatured']??false,
  productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
  productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
  productType: data['ProductType']);
}
}