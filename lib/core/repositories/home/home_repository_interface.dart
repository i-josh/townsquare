import '../../network/api_response.dart';

abstract class IHomeRepository {
  Future<ApiResponse> getPosts();
}
