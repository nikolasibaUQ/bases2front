import 'package:bases2/core/api/endpoints.dart';
import 'package:bases2/core/either/either.dart';
import 'package:bases2/features/auth/domain/entities/user_data.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final Dio dio = Dio();

  Future<Either<Exception, UserData>> login(
      String email, String password) async {
    try {
      final response = await dio.post(Endpoints.login,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
            },
          ),
          data: {
            'username': email,
            'password': password,
          });

      if (response.statusCode == 200) {
        return Right(UserData.fromJson((response.data['data'])));
      } else {
        return Left(Exception('Error en la petición'));
      }
    } on DioException catch (e) {
      return Left(Exception(e.response?.data['detail']));
    } catch (e) {
      return Left(Exception('Error en la petición'));
    }
  }
}
