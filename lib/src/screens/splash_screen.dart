part of 'screens.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckLoginCubit()..checkLogin(),
      child: BlocConsumer<CheckLoginCubit, CheckLoginState>(
        listener: (context, state) {
          if (state is CheckLoginIsSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ListScreen()));
          } else if (state is CheckLoginIsFailed) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
        },
        builder: (context, state) {
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
        },
      ),
    );
  }
}
