part of 'services.dart';

class UserService {
  //init shared preference
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  //Buat fungsi check login dari shared_preferens / Local storage
  Future<BaseResponse> checkLogin() async {
    final storage = await prefs;
    if (storage.getBool(pernahLogin) == true) {
      return BaseResponse(true, 'Berhasil');
    } else {
      return BaseResponse(null, 'Token kedaluwarsa');
    }
  }

  //Fungsi Logout
  Future<BaseResponse> logout() async {
    final storage = await prefs;
    if (storage.getBool(pernahLogin) == true) {
      storage.clear();
      return BaseResponse(null, 'Berhasil Logout');
    } else {
      return BaseResponse(true, 'Masih Login');
    }
  }

  //Buat fungsi login by API
}
