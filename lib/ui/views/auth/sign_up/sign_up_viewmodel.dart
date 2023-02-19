import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.logger.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/auth/auth_repository.dart';
import 'package:townsquare/core/utils/extensions.dart';

class SignUpViewModel extends BaseViewModel {
  final _repo = locator<AuthRepository>();
  final log = getLogger("SignUpViewModel");
  final snackBar = locator<SnackbarService>();
  final nav = locator<NavigationService>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      setBusy(true);

      try {
        ApiResponse response = await _repo.signUp({
          "username": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text
        });
        if (response.statusCode == 200) {
          nav.back();
          snackBar.showSnackbar(message: response.data["message"]);
        } else {
          snackBar.showSnackbar(message: response.data["message"]);
        }
      } catch (e) {
        log.e(e);
      }

      setBusy(false);
    }
  }

  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return "Username is required";
    }
    return null;
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
