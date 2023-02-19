import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/network/api_service.dart';
import 'package:townsquare/core/repositories/auth/auth_repository_interface.dart';

class AuthRepository extends IAuthRepository {
  final api = locator<ApiService>();

  @override
  Future<ApiResponse> signIn(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "users/login",
      reqBody: request,
    );

    return response;
  }

  @override
  Future<ApiResponse> signUp(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "users/register",
      reqBody: request,
    );

    return response;
  }
}
