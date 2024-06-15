import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApiProvider{
  final Dio _dio = Dio();
  Future<dynamic> homeData(Map map) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString("session");
    try {
      var response = await _dio.post('https://interview.esavis.ir/api',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              "Authorization":"Bearer $token",
              'omax-apikey': "cc751c6d-42cd-468f-84a3-59f85dc6b944"
            },
          ),
          data: map);
      return response;
    } on DioException catch (e) {
      print('Error: ${e.response?.data ?? e.message}');
      return e.response?.data ?? {'error': e.message};
    }
  }
}