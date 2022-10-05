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
  String nama = '';
  int bottomNavBarIndex = 0;

  void ubahNama() {
    setState(() {
      nama = "Candra";
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //posisi index = 0

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(nama),
        actions: [
          IconButton(onPressed: ubahNama, icon: Icon(Icons.person)),
          IconButton(
              onPressed: () async {
                SharedPreferences storage = await prefs;
                if (storage.getBool('pernah_login') == true) {
                  storage.clear().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  });
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavBarIndex,
        onTap: (value) {
          setState(() {
            bottomNavBarIndex = value;
          });
        },
        items: [
          //Index ke 0
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'ListView'),
          //Index ke 1
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3), label: 'GridView'),
        ],
      ),
      body:
          // Perbandingan                 //Nilai True          //Nilai False
          (bottomNavBarIndex == 0) ? const ListProduct() : const GridProduct(),
    );
  }
}

class GridProduct extends StatelessWidget {
  const GridProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: products
          .map((e) => ProductWidget(
                product: e,
              ))
          .toList(),
    );
  }
}

class ListProduct extends StatelessWidget {
  const ListProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        return ContactWidget(
          data: contacts[index],
        );
      },
    );
  }
}
