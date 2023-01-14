import '../../network/api_response.dart';

abstract class IHomeRepository {
  Future<ApiResponse> getPosts();

  Future<ApiResponse> getPostsByCategory(String category);

  Future<ApiResponse> getComments(String id);

  Future<ApiResponse> incrementViews(String id);

  Future<ApiResponse> addComment(Map<String, dynamic> request);
}
