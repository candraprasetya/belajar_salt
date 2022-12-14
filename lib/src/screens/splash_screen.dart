part of 'screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      checkLogin();
    });
    super.initState();
  }

  Future<void> checkLogin() async {
    final SharedPreferences storage = await prefs;
    if (storage.getBool('pernah_login') == true) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const LifecycleWidget(child: ListScreen())));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Salt E-Commmerce',
              style: TextStyle(
                  color: Colors.pink[800], fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.pink[800]),
            ),
          ],
        ),
      ),
    );
  }
}
