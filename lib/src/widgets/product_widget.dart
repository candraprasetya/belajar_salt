part of 'widgets.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image Network
              Image.network(product.imageUrl!),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    //Text Nama Produk
                    Text(product.productName!),
                    //Text Harga
                    Text("Rp.${product.productPrice!}")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
