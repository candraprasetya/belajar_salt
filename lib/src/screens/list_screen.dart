part of 'screens.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  //Buat variable untuk tahu posisi bottom nav bar yang nyala
  //Inisialisasi Storage/ Shared Preference
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  NotificationService notifService = NotificationService();

  Future<dynamic> onReceiveNotif(int id, String? title, String? body) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title!),
          content: Text(body!),
          actions: [
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Kamu Mendapatkan $body')));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  String nama = '';
  int bottomNavBarIndex = 0;

  void showNotif() {
    notifService.showNotifBirthday('Ada Promo nich buat kamu',
        'Mens Casual Slim Fit yang kamu inginkan turun harga 70%', '3');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notif akan muncul setelah 10 detik')));
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    //Fungsi menampilkan alert
    // showDialog(
    //     context: context,
    //     builder: (context) => AlertDialog(
    //           title: Text('Kamu Cantik'),
    //           actions: [
    //             TextButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 child: Text('Close'))
    //           ],
    //         ));

    //Fungsi masuk ke halaman detail
    BlocProvider.of<ProductDetailBloc>(context)
        .add(FetchProductDetail(int.parse(payload!)));
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetailProductScreen()));
  }

  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
    notifService.init((p0, p1, p2, p3) => onReceiveNotif(p0, p1, p3),
        onDidReceiveNotificationResponse);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //posisi index = 0

    return (Platform.isAndroid) ? _buildAndroidPage() : _buildIosPage();
  }

  Widget _buildIosPage() {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(nama),
      ),
      child:
          (bottomNavBarIndex == 0) ? const ListProduct() : const GridProduct(),
    );
  }

  Widget _buildAndroidPage() {
    return RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<ProductBloc>(context).add(FetchProductFromAPI());
        },
        child: BlocListener<CheckLoginCubit, CheckLoginState>(
            listener: (context, state) {
              if (state is CheckLoginIsLoggedOut) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Berhasil Log Out")));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text(nama),
                actions: [
                  IconButton(
                      onPressed: showNotif, icon: const Icon(Icons.person)),
                  IconButton(
                      onPressed: () {
                        context.read<CheckLoginCubit>().logout();
                      },
                      icon: const Icon(Icons.logout))
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: bottomNavBarIndex,
                onTap: (value) {
                  setState(() {
                    bottomNavBarIndex = value;
                  });
                },
                items: const [
                  //Index ke 0
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: 'ListView'),
                  //Index ke 1
                  BottomNavigationBarItem(
                      icon: Icon(Icons.grid_3x3), label: 'GridView'),
                ],
              ),
              body:
                  // Perbandingan                 //Nilai True          //Nilai False
                  (bottomNavBarIndex == 0)
                      ? const ListProduct()
                      : const GridProduct(),
            )));
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductIsFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is ProductIsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ProductIsSuccess) {
          return GridView.count(
            crossAxisCount: 2,
            children: state.data.map((e) => ProductWidget(product: e)).toList(),
          );
        }
        return Container();
      },
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductIsFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is ProductIsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is ProductIsSuccess) {
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              return ProductWidget(product: state.data[index]);
            },
          );
        }
        return Container();
      },
    );
  }
}
