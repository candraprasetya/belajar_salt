part of 'screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Menambahkan 2 TextEditingController (Email dan Password)
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  //Tambahkan 1 boolean untuk login proses
  bool isLoginProcessing = false;

  Widget _buildTextField(String hint, TextEditingController newController,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        controller: newController,
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(hintText: hint),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 36),
          ),
          const SizedBox(height: 24),
          _buildTextField('Email', emailController),
          _buildTextField('Password', passController, isPassword: true),
          const SizedBox(height: 24),
          ButtonWidget(
            onPressed: () async {
              //Untuk init si storage
              final SharedPreferences storage = await prefs;

              setState(() {
                isLoginProcessing = true;
              });

              Future.delayed(const Duration(milliseconds: 3000), () {
                //Jika emailnya adalah nama@gmail.com dan passwordnya 12345678
                //Maka diarahkan ke ListScreen
                if (emailController.text == "candra@candra.com" &&
                    passController.text == '12345678') {
                  //Simpan Session
                  storage.setBool('pernah_login', true);

                  //Arahkan ke ListScreen
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(),
                      ));

                  setState(() {
                    isLoginProcessing = false;
                  });
                } else {
                  setState(() {
                    isLoginProcessing = false;
                  });
                  storage.setBool('pernah_login', false);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Login Gagal')));
                }

                //Jika tidak, maka muncul snackbar
              });
            },
            isLoading: isLoginProcessing,
            caption: 'Login',
          )
        ],
      ),
    );
  }
}
