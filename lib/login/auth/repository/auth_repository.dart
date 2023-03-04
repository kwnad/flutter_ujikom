import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ujikom/login/auth/models/login_request.dart';
import 'package:ujikom/login/auth/models/login_response.dart';

class AuthRepository {
  Dio _dio = Dio();

  Future<Either<String, LoginResponse>> signInUserWithEmailAndPassword(
      {required LoginRequest loginRequest}) async {
    Response _response;
    try {
      _response = await _dio.post(
          "http://pkl-assalam.4vmapps.com/api/auth/login",
          data: loginRequest.toJson());

      print(_response.statusCode);
      print(_response.headers);
      print(_response.data);
      print(_response.realUri);

      String _result = _response.data.toString();
      LoginResponse _loginResp = LoginResponse.fromJson(_response.data);
      return right(_loginResp);
    } on DioError catch (e) {
      // contoh Menggunakan if
      // if(e.type == DioErrorType.response){}
      print('======= Status Code ========');
      print(e.response!.statusCode);
      print('====== Headers =========');
      print(e.response!.headers);
      print('====== Data ===========');
      print(e.response!.data);

      String errormessage = e.response!.data.toString();
      String rightmessage = e.response!.data.toString();

      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          break;
        case DioErrorType.response:
          errormessage = e.response!.data['message'];
          break;
        case DioErrorType.cancel:
          // TODO: Handle this case.
          break;
        case DioErrorType.other:
          // TODO: Handle this case.
          break;
      }
      return left(errormessage);
    }
  }
}
