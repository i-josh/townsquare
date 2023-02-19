import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.logger.dart';
import 'package:townsquare/core/app/app.router.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/core/models/user.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/auth/auth_repository.dart';
import 'package:townsquare/core/utils/extensions.dart';
import 'package:townsquare/core/utils/local_store_dir.dart';
import 'package:townsquare/core/utils/local_stotage.dart';
import 'package:townsquare/globals.dart';

class SignInViewModel extends BaseViewModel {
  final _repo = locator<AuthRepository>();
  final log = getLogger("SignInViewModel");
  final snackBar = locator<SnackbarService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setBusy(true);
      try {
        ApiResponse apiResponse = await _repo.signIn({
          "email": emailController.text,
          "password": passwordController.text,
        });
        if (apiResponse.statusCode == 200) {
          log.i(apiResponse);
          locator<NavigationService>().replaceWith(Routes.home);
          locator<LocalStorage>().save(
            key: LocalStorageDir.authToken,
            type: StorageType.string,
            value: apiResponse.data["token"],
          );

          User user = User.fromJson(
              Map<String, dynamic>.from(apiResponse.data["user"]));

          locator<LocalStorage>().save(
            key: LocalStorageDir.authUser,
            type: StorageType.string,
            value: jsonEncode(user),
          );

          userValueNotifier.value = user;
        } else {
          log.e(apiResponse.data);
          if (apiResponse.data["message"] != null) {
            snackBar.showSnackbar(message: apiResponse.data["message"]);
          } else {
            apiResponse.data["errors"].forEach((e) {
              snackBar.showSnackbar(message: e);
            });
          }
        }
      } catch (e) {
        log.e(e);
      }
      setBusy(false);
    }
  }

  String? validateEmail(String? value) {
    if (!value!.isValidEmail()) {
      return "Enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty || value.length < 6) {
      return "Password is required";
    }
    return null;
  }
}
