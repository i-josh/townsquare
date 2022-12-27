import 'package:townsquare/core/network/api_response.dart';

abstract class IAuthRepository {
  Future<ApiResponse> signIn(Map<String, dynamic> request);
}
