part of 'screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget _buildHeaderText() {
    return Column(
      children: [
        Text(
          'Hello Again!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //TODO Text hello dan welcome back

          //TODO Textfield untuk username dan password

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
