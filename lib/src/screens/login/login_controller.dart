import 'package:belajar_flutter/src/screens/screens.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString username = ''.obs;
  String tempatLahir = '';

  List<String> data = ['Tahu', 'Bulat', 'Digoreng'];

  void changeName(String newName) {
    if (newName.length >= 5) {
      username.value = newName;
    }
  }

  void changeTempatLahir(String newValue) {
    tempatLahir = newValue;
    update();
  }

  void submitData() {
    if (username.value.isNotEmpty && tempatLahir.isNotEmpty) {
      Get.to(ListScreen());
    } else {
      Get.snackbar('Lengkapi Data', 'Lengkapi data kamu');
    }
  }
}
