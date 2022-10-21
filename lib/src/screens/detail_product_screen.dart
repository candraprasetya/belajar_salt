part of 'screens.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildModalWidget() {
      return Material(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                "MODAL BOTTOM SHEET",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    elevation: 0.0,
                    backgroundColor:
                        Color(0xFFB53471), //#B53471 jadi 0XFFB53471
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100))),
                child: Text('Selesai'),
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Produk'),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0.0, 0.0),
              color: Colors.black12,
            )
          ]),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context, builder: (context) => buildModalWidget());
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                elevation: 0.0,
                backgroundColor: Color(0xFFB53471), //#B53471 jadi 0XFFB53471
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: Text('Masukkan keranjang'),
          ),
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
              return SingleChildScrollView(
                  child: DetailProductWidget(detailProduct: state.model));
            }

            return Container();
          },
        ));
  }
}
