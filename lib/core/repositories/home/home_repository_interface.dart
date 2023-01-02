import '../../network/api_response.dart';

abstract class IHomeRepository {
  Future<ApiResponse> getPosts();

  Future<ApiResponse> getComments(String id);

  Future<ApiResponse> incrementViews(String id);
}
