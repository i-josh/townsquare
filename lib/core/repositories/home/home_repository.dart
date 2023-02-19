import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/home/home_repository_interface.dart';

import '../../di/service_locator.dart';
import '../../network/api_service.dart';

class HomeRepository implements IHomeRepository {
  final api = locator<ApiService>();

  @override
  Future<ApiResponse> getPosts({Map<String, dynamic>? queryParams}) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "posts",
      queryParams: queryParams,
    );

    return response;
  }

  @override
  Future<ApiResponse> getComments(String id) async {
    ApiResponse response =
        await api.call(method: HttpMethod.get, endpoint: "posts/comments/$id");

    return response;
  }

  @override
  Future<ApiResponse> incrementViews(String id) async {
    ApiResponse response = await api.call(
        method: HttpMethod.get, endpoint: "posts/updateViews/$id");

    return response;
  }

  @override
  Future<ApiResponse> addComment(Map<String, dynamic> request) async {
    ApiResponse response = await api.call(
      method: HttpMethod.post,
      endpoint: "posts/comment",
      reqBody: request,
    );

    return response;
  }

  @override
  Future<ApiResponse> getPostsByCategory(String category) async {
    ApiResponse response = await api.call(
      method: HttpMethod.get,
      endpoint: "posts/category/$category",
    );

    return response;
  }
}
