part of 'screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildHeaderText(Size size) {
    return SizedBox(
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SafeArea(
            child: Text(
              'Hello Again!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Welcome back you’ve been missed!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //variable size
    Size size = MediaQuery.of(context).size;
    print(size.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO Text hello dan welcome back
          _buildHeaderText(size),
          //TODO Textfield untuk username dan password
          SizedBox(
            height: 24,
          ),
          //TODO text recovery password

          //TODO Button Sign In

          //TODO Text continue with

          //TODO Social Media Button

          //TODO butotn register
        ],
      ),
    );
  }
}
