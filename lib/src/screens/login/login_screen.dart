part of '../screens.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final c = Get.put(LoginController());

  bool isLoginProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text('Hallo ${c.username.value}')),
          GetBuilder<LoginController>(
            builder: (controller) =>
                Text('Kamu Lahir di ${controller.tempatLahir}'),
          ),
          TextField(
            onChanged: (value) {
              c.changeName(value);
            },
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          TextField(
            onChanged: (value) {
              c.changeTempatLahir(value);
            },
            decoration: const InputDecoration(hintText: 'Username'),
          ),
          ElevatedButton(
              onPressed: () {
                c.submitData();
              },
              child: const Text('Submit Data')),

          //////////////
          ButtonWidget(
            onPressed: () {
              setState(() {
                isLoginProcessing = true;
              });
              // Durasi, Function
              Future.delayed(const Duration(milliseconds: 3000), () {
                if (c.username.value.isEmpty) {
                  setState(() {
                    isLoginProcessing = false;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Error, kamu jelek!",
                      style: TextStyle(color: Colors.red),
                    ),
                    backgroundColor: Colors.red[100],
                  ));
                }
              });
            },
            isLoading: isLoginProcessing,
            caption: 'Tahu',
          )
        ],
      ),
    );
  }
}
