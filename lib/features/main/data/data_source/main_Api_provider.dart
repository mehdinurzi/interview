import 'package:dio/dio.dart';

class MainApiProvider{
  final Dio _dio = Dio();

  Future<dynamic> homeData(Map map) async {
    try {
      var response = await _dio.post('https://interview.esavis.ir/api',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
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