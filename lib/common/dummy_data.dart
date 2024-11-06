import 'package:e_shop/features/shop/models/banner_model.dart';
import 'package:e_shop/features/shop/models/brand_model.dart';
import 'package:e_shop/features/shop/models/category_model.dart';
import 'package:e_shop/features/shop/models/product_attributes.dart';
import 'package:e_shop/features/shop/models/product_model.dart';
import 'package:e_shop/features/shop/models/product_variation.dart';
import 'package:e_shop/routes/routes.dart';
import 'package:e_shop/utils/constants/images.dart';

import '../utils/constants/enums.dart';

class TDummyData{

  static final List<CategoryModel>categories=[
    CategoryModel(id: '1', name: 'Electronics', image: TImages.electronic, isFeatured: true),
    CategoryModel(id: '2', name: 'Furniture', image: TImages.furniture, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothes, isFeatured: true),
    CategoryModel(id: '4', name: 'Shoes', image: TImages.shoes, isFeatured: true),
    CategoryModel(id: '5', name: 'Cosmetics', image: TImages.cosmetics, isFeatured: true),
    CategoryModel(id: '6', name: 'Jewelery', image: TImages.jewellery, isFeatured: true),
    CategoryModel(id: '7', name: 'Sports', image: TImages.sport, isFeatured: true),
    
     CategoryModel(id: '8', name: 'Sports Shoes', parentId: '7',image: TImages.sportshoes, isFeatured: false),
      CategoryModel(id: '9', name: 'Track suits',parentId: '7' ,image: TImages.tracksuit, isFeatured: false),
      //  CategoryModel(id: '10', name: 'Sports Equipments', parentId: '7',image: TImages.sportqui, isFeatured: false),
     
      CategoryModel(id: '11', name: 'Bedroom furniture', parentId: '2',image: TImages.bedroom, isFeatured: false),
      CategoryModel(id: '12', name: 'Kitchen furniture',parentId: '2' ,image: TImages.kitchen, isFeatured: false),
       CategoryModel(id: '13', name: 'Office furniture', parentId: '2',image: TImages.office, isFeatured: false),

       CategoryModel(id: '14', name: 'Laptops', parentId: '1',image: TImages.hp, isFeatured: false),
      CategoryModel(id: '15', name: 'Accessories',parentId: '1' ,image: TImages.accessories, isFeatured: false),
       CategoryModel(id: '16', name: 'Speakers', parentId: '1',image: TImages.speaker, isFeatured: false),

         CategoryModel(id: '17', name: 'Shirts', parentId: '3',image: TImages.shirt, isFeatured: false),
      CategoryModel(id: '18', name: 'T-shirts',parentId: '3' ,image: TImages.productImage68, isFeatured: false),
       CategoryModel(id: '19', name: 'Jeans', parentId: '3',image: TImages.jeans, isFeatured: false),

       CategoryModel(id: '20', name: 'Bracelets', parentId: '6',image: TImages.bracelets, isFeatured: false),
      CategoryModel(id: '21', name: 'Rings',parentId: '6' ,image: TImages.rings, isFeatured: false),
  ];
  static final List<BannerModel> banners=[
    BannerModel(imageUrl: TImages.banner1, active: false, targetScreen: TRoutes.order),
    BannerModel(imageUrl: TImages.banner2, active: true, targetScreen: TRoutes.cart),
    BannerModel(imageUrl: TImages.banner3, active: true, targetScreen: TRoutes.favourites),
    BannerModel(imageUrl: TImages.banner4, active: true, targetScreen: TRoutes.search),
    BannerModel(imageUrl: TImages.banner5, active: true, targetScreen: TRoutes.settings),
    BannerModel(imageUrl: TImages.banner6, active: true, targetScreen: TRoutes.checkout),
  ];
  static final List<ProductModel> products=[
    ProductModel(id: '001', stock: 15, price: 135, title: 'Green Nike sports shoe',
    isFeatured: true,
    description: 'Green Nike sports shoe',
    brand: BrandModel(id: '1',image:TImages.nikeLogo,name: 'Nike',productsCount: 222,isFeatured: true ),
    images: [TImages.productImage1,TImages.productImage23,TImages.productImage24],
    salePrice: 3000,
    sku: 'ABR342',
    categoryId: '4',
    productAttributes: [ProductAttributeModel(name: 'Color',values: ['Green','Balck','Red']),
    ProductAttributeModel(name: 'Size',values: ['EU 30','EU 32','EU 34'])
    ],
productVariations: [
  ProductVariationModel(id: '1', stock: 34,price: 134,salePrice: 122,image: TImages.productImage1,description: 'This is a Product description for Green Nike sports shoe', attributeValues:{'Color':'Green','Size':'EU 34'} ),
   ProductVariationModel(id: '2', stock: 34,price: 134,salePrice: 122,image: TImages.productImage24,description: 'This is a Product description for Red Nike sports shoe', attributeValues:{'Color':'Red','Size':'EU 32'} ),
   ProductVariationModel(id: '2', stock: 34,price: 134,salePrice: 122,image: TImages.productImage24,description: 'This is a Product description for Red Nike sports shoe', attributeValues:{'Color':'Black','Size':'EU 30'} )
],
     thumbnail: TImages.productImage1, productType: ProductType.variable.toString()),
 ProductModel(id: '002', stock: 15, price: 135, title: 'Blue T-shirt for all ages',
    isFeatured: true,
    description: 'Blue T-shirt for all ages',
    brand: BrandModel(id: '6',image:TImages.zaraLogo,name: 'ZARA',productsCount: 22,isFeatured: true ),
    images: [TImages.productImage69,TImages.productImage68,TImages.productImage5],
    salePrice: 3000,
    sku: 'ABR342',
    categoryId: '4',
    productAttributes: [ProductAttributeModel(name: 'Color',values: ['Blue','Red','Black']),
    ProductAttributeModel(name: 'Size',values: ['EU32','EU34'])
    ],
productVariations: [
  ProductVariationModel(id: '001', stock: 34,price: 134,salePrice: 122,image: TImages.productImage69,description: 'This is a Product description for Blue Zara T-shirt', attributeValues:{'Color':'Blue','Size':'EU34'} ),
   ProductVariationModel(id: '2', stock: 34,price: 134,salePrice: 122,image: TImages.productImage68,description: 'This is a Product description for Red  Zara T-shirte', attributeValues:{'Color':'Red','Size':'EU32'} ),
   ProductVariationModel(id: '2', stock: 34,price: 134,salePrice: 122,image: TImages.productImage5,description: 'This is a Product description for Black Zara T-shirt', attributeValues:{'Color':'Black','Size':'EU32'} )
],
     thumbnail: TImages.productImage5, productType: ProductType.variable.toString().toString()),
 
 
 
  ProductModel(id: '003', stock: 15, price: 135, title: 'Black Dinning Room Table',
    isFeatured: true,
    description: 'Black Dinning Room Table for all home',
    brand: BrandModel(id: '5',image:TImages.zaraLogo,name: 'Segmart',productsCount: 220,isFeatured: true ),
    images: [TImages.productImage70,TImages.productImage71,],
    salePrice: 60000,
    sku: 'ABR367',
    categoryId: '12',
    productAttributes: [ProductAttributeModel(name: 'Color',values: ['Grey','Black',]),
    ],
productVariations: [
  ProductVariationModel(id: '004', stock: 34,price: 53400,salePrice: 51000,image: TImages.productImage70,description: 'This is a Product description for Blue Segmart Dinning Table', attributeValues:{'Color':'Grey'} ),
   ProductVariationModel(id: '002', stock: 34,price: 60000,salePrice: 58000,image: TImages.productImage71,description: 'This is a Product description for Black Segmart Dinning Table', attributeValues:{'Color':'Black',} )
],
     thumbnail: TImages.productImage70, productType: ProductType.variable.toString()),
 
 
 ProductModel(id: '004', stock: 45, price: 135, title: 'Black Hp Envy',
    isFeatured: true,
    description: 'HP Envy X360 2-in-1 Laptop, 15.6 Full HD Touchscreen, Intel Core i5, 16GB RAM, 1TB SSD, Windows 11 Home',
    brand: BrandModel(id: '4',image:TImages.hp,name: 'Hp',productsCount: 40,isFeatured: true ),
    images: [TImages.productImage73,TImages.productImage72,],
    salePrice: 170000,
    sku: 'ABR368',
    categoryId: '14',
    productAttributes: [ProductAttributeModel(name: 'Capacity',values: ['16 RAM | 1 TB SSD','16 RAM | 512 GB SSD',]),
    ],
productVariations: [
  ProductVariationModel(id: '005', stock: 14,price: 53400,salePrice: 165000,image: TImages.productImage72,description: 'This is a Product description for 16 RAM | 1 TB SSD Hp Envy Laptop', attributeValues:{'Capacity':'16 RAM | 1 TB SSD'} ),
   ProductVariationModel(id: '006', stock: 54,price: 60000,salePrice: 109000,image: TImages.productImage73,description: 'This is a Product description for 16 RAM | 512 TB SSD Hp Envy Laptop', attributeValues:{'Capacity':'16 RAM | 512 GB SSD',} )
],
     thumbnail: TImages.productImage73, productType: ProductType.variable.toString()),
 ProductModel(id: '005', stock: 45, price: 135, title: 'CB Gold Jewelry',
    isFeatured: true,
    description: 'Ethiopian Womens 18k Gold Plated Bangle Bracelet Set for Party Decoration',
    brand: BrandModel(id: '10',image:TImages.cbLogo,name: 'CB ',productsCount: 40,isFeatured: true ),
    images: [TImages.bracelets,TImages.productImage74,],
    salePrice: 1700,
    sku: 'ABR370',
    categoryId: '20',
    productAttributes: [ProductAttributeModel(name: 'Styles',values: ['4pcs','1pcs',]),
    ],
productVariations: [
  ProductVariationModel(id: '007', stock: 80,price: 4200,salePrice: 3900,image: TImages.productImage72,description: 'This is a Product description for  4pcs CB Gold Bracelet', attributeValues:{'Styles':'4pcs'} ),
   ProductVariationModel(id: '008', stock: 54,price: 1800,salePrice: 1775,image: TImages.productImage73,description: 'This is a Product description for 1pcs CB Gold Bracelet', attributeValues:{'Styles':'1pcs',} )
],
     thumbnail: TImages.bracelets, productType: ProductType.variable.toString()),

     ProductModel(id: '006', stock: 125, price: 2100, title: 'LAOYOU Spinner Ring for Women',
    isFeatured: true,
    description: 'LAOYOU Spinner Ring for Women - Anxiety Relief, 3Pcs Stainless Steel Sand Blast Glitter Finish Set, Rose Gold Silver Rainbow Color',
    brand: BrandModel(id: '11',image:TImages.laoLogo,name: 'LAOYOU ',productsCount: 20,isFeatured: true ),
    images: [TImages.rings,TImages.productImage75,TImages.productImage76,TImages.productImage77,TImages.productImage78,],
    salePrice: 2000,
    sku: 'ABR369',
    categoryId: '21',
    productAttributes: [ProductAttributeModel(name: 'Color',values: ['1pc Gold Color','1pc Rainbow Color','1pc Rose Gold Color', '1pc Silver Gold Color','Silver,Gold and Black Tri Color Set','Silver,Rose Gold and Rainbow Three Color Set']),
    ProductAttributeModel(name: 'Size',values: ['5','6','9', '10','11','12']),
    

    ],
productVariations: [
  ProductVariationModel(id: '011', stock: 50,price: 2200,salePrice: 2060,image: TImages.productImage75,description: 'LAOYOU Anxiety Fidget Relief Spinner Ring for Women ', attributeValues:{'Color':'1pc Gold Color','Size':'11'} ),
  ProductVariationModel(id: '012', stock: 24,price: 2200,salePrice: 2060,image: TImages.productImage76,description: 'LAOYOU Anxiety Fidget Relief Spinner Ring for Women ', attributeValues:{'Color':'1pc Rainbow Color','Size':'11'} ),
  ProductVariationModel(id: '013', stock: 40,price: 2200,salePrice: 2060,image: TImages.productImage77,description: 'LAOYOU Anxiety Fidget Relief Spinner Ring for Women ', attributeValues:{'Color':'1pc Rose Gold Color','Size':'11'} ),
  ProductVariationModel(id: '014', stock: 24,price: 2600,salePrice: 2560,image: TImages.productImage78,description: 'LAOYOU Anxiety Fidget Relief Spinner Ring for Women ', attributeValues:{'Color':'Silver,Gold and Black Tri Color Set','Size':'11'} ),
  ProductVariationModel(id: '015', stock: 44,price: 2600,salePrice: 2560,image: TImages.rings,description: 'LAOYOU Anxiety Fidget Relief Spinner Ring for Women ', attributeValues:{'Color':'Silver,Gold and Black Tri Color Set','Size':'11'} )
],
     thumbnail: TImages.rings, productType: ProductType.variable.toString()),
  ];
}