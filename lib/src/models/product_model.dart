part of 'models.dart';

class ProductModel {
  final String? productName;
  final String? productDesc;
  final String? imageUrl;
  final double? productPrice;

  ProductModel(
      {this.productName, this.productDesc, this.imageUrl, this.productPrice});
}

List<ProductModel> products = [
  ProductModel(
      imageUrl:
          'https://www.piknikdong.com/wp-content/uploads/2021/01/Cara-Membuat-Tahu-Bulat-min.jpg',
      productDesc: 'Tahu bulat digoreng dadakan gurih nyoi',
      productName: 'Tahu Bulat',
      productPrice: 5000),
  ProductModel(
      imageUrl:
          'https://www.piknikdong.com/wp-content/uploads/2021/01/Cara-Membuat-Tahu-Bulat-min.jpg',
      productDesc: 'Tahu bulat digoreng dadakan gurih nyoi',
      productName: 'Tahu Bulat',
      productPrice: 5000),
];
