import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.logger.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/home/home_repository.dart';
import 'package:townsquare/core/utils/local_store_dir.dart';
import 'package:townsquare/core/utils/local_stotage.dart';
import 'package:townsquare/globals.dart';

import '../../../core/di/service_locator.dart';

class HomeViewModel extends BaseViewModel {
  final _repo = locator<HomeRepository>();
  final snackBar = locator<SnackbarService>();

  List<Post>? posts;
  final log = getLogger("HomeViewModel");

  void initialize() async {
    // await locator<LocalStorage>().delete(key: LocalStorageDir.authToken);
    log.i("called");
    checkToken();
    getPosts();
  }

  void checkToken() async {
    String? authToken = await locator<LocalStorage>().fetch(
      key: LocalStorageDir.authToken,
      type: StorageType.string,
    );

    tokenValueNotifier.value = authToken;
  }

  void getPosts() async {
    try {
      ApiResponse apiResponse = await _repo.getPosts();
      if (apiResponse.statusCode == 200) {
        List<Post> newData = [];
        List<dynamic> responseData = apiResponse.data["data"];
        for (var element in responseData) {
          newData.add(Post.fromJson(Map<String, dynamic>.from(element)));
        }
        posts = newData;
        notifyListeners();
      } else {
        log.e(apiResponse.data);
        snackBar.showSnackbar(message: apiResponse.data["message"]);
      }
    } catch (e) {
      log.e(e);
    }
  }
}
