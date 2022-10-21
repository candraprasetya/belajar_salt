part of 'widgets.dart';

class DetailProductWidget extends StatelessWidget {
  final DetailProductModel detailProduct;

  const DetailProductWidget({super.key, required this.detailProduct});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.blue, Colors.red, Colors.black];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: detailProduct.id!,
              child: Image.network(detailProduct.image!)),
          const SizedBox(
            height: 24,
          ),
          Text(
            detailProduct.title!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text("Rp.${detailProduct.price!}"),
          Text("Rp.${detailProduct.description!}"),
          BlocBuilder<cubit.ColorSelectCubit, cubit.ColorSelectState>(
            builder: (context, state) {
              return Row(
                children: colors.map((e) {
                  int index = colors.indexOf(e);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<cubit.ColorSelectCubit>(context)
                            .changeColor(index);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: (index ==
                                (state as cubit.ColorSelectIsSelected).index)
                            ? 40
                            : 24,
                        height: (index == state.index) ? 40 : 24,
                        color: e,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
