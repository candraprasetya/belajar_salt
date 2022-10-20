part of 'widgets.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;

  const ProductWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProductDetailBloc>(context)
            .add(FetchProductDetail(product.id!));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailProductScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image Network
                Hero(tag: product.id!, child: Image.network(product.image!)),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //Text Nama Produk
                      Text(product.title!),
                      //Text Harga
                      Text("Rp.${product.price!}")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
