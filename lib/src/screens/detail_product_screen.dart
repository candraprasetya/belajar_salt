part of 'screens.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Produk'),
        ),
        body: BlocConsumer<ProductDetailBloc, ProductDetailState>(
          listener: (context, state) {
            if (state is ProductDetailIsFailed) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is ProductDetailIsLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ProductDetailIsSuccess) {
              return DetailProductWidget(detailProduct: state.model);
            }

            return Container();
          },
        ));
  }
}
