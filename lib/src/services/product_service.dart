part of 'services.dart';

class ProductService {
  //List Product
  Future<BaseResponse> fetchProductList() async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}products"));
      if (response.statusCode == 200) {
        return BaseResponse(response.body, 'Berhasil');
      } else {
        return BaseResponse(null, 'Gagal');
      }
    } catch (e) {
      return BaseResponse(null, e.toString());
    }
  }

  //Detail Product
  Future<BaseResponse> fetchProductDetail(int id) async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}products/$id"));
      if (response.statusCode == 200) {
        return BaseResponse(response.body, 'Berhasil');
      } else {
        return BaseResponse(null, 'Gagal');
      }
    } catch (e) {
      return BaseResponse(null, e.toString());
    }
  }
}
