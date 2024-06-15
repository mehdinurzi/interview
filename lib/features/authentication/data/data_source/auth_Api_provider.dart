import 'package:dio/dio.dart';

class AuthApiProvider {
  final Dio _dio = Dio();

  Future<dynamic> phoneAuth(Map map) async {
    try {
      var response = await _dio.post('https://interview.esavis.ir/api',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'omax-apikey': "00000000-0000-0000-0000-000000000000"
            },
          ),
          data: map);
      return response;
    } on DioException catch (e) {
      print('Error: ${e.response?.data ?? e.message}');
      return e.response?.data ?? {'error': e.message};
    }
  }

  Future<dynamic> sendOtpCode(Map map) async {
    try {
      var response = await _dio.post('https://interview.esavis.ir/api',
          options: Options( 
            method: 'POST',
            headers: {
              'Content-Type': 'application/json',
              'omax-apikey': "00000000-0000-0000-0000-000000000000"
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
