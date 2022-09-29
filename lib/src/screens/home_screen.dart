part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final c = Get.put(LoginController());

  Color color = Colors.red;
  int count = 0;
  bool isLoginProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            //TODO Baris Pertama
            Text('Hallo $count'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: c.data.length,
              itemBuilder: (context, index) => Text(c.data[index]),
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  count = Random().nextInt(800000000);
                });
              },
              child: Container(
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Lottie.asset('assets/animations/button.json'),
                    Text(
                      'Dapatkan Hadiahmu Sekarang',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),

            ButtonWidget(
              caption: 'Klik Aku dong',
              isLoading: isLoginProcessing,
              onPressed: () {
                setState(() {
                  isLoginProcessing = true;
                });
              },
            ),
          ],
        ),
      ),
    ));
  }
}
