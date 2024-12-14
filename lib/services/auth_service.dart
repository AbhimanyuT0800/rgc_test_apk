import 'package:dio/dio.dart';
import 'package:rgc_test_apk/core/constants/app_urls.dart';
import 'package:rgc_test_apk/core/utils/snakbar.dart';
import 'package:rgc_test_apk/model/auth_model/auth_model.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: AppUrls.baseUrl));

  Future<AuthModel?> checkUserIsValid(String mail, String pass) async {
    try {
      final response = await _dio.post(
        AppUrls.login,
        data: {"email": mail, "password": pass},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final data = AuthModel.fromJson(response.data);

        return data;
      } else {
        SnackbarUtils.showSnakBar('Somthing went wrong...Try again');
      }
    } catch (e) {
      SnackbarUtils.showSnakBar('Error occurred: ${e.toString()}');
    }
    return null;
  }
}
