import 'package:stacked/stacked.dart';
import 'package:townsquare/core/app/app.logger.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/home/home_repository.dart';

class ForumViewModel extends BaseViewModel {
  final _repo = locator<HomeRepository>();
  final log = getLogger("ForumViewModel");
  List<Post>? posts;

  void getPostByCategory(String category) async {
    try {
      ApiResponse response = await _repo.getPostsByCategory(category);
      if (response.statusCode == 200) {
        List<Post> newData = [];
        List<dynamic> responseData = response.data["data"];
        for (var element in responseData) {
          newData.add(Post.fromJson(Map<String, dynamic>.from(element)));
        }
        posts = newData;
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
    }
  }
}
