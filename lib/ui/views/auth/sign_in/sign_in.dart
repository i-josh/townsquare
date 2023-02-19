import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.router.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/ui/components/submit_button.dart';
import 'package:townsquare/ui/components/text_field_widget.dart';

import '../../../components/logo.dart';
import '../../../values/colors.dart';
import 'sign_in_viewmodel.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.secondary.withOpacity(0.5),
        body: Center(
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(30),
              height: 600,
              width: 500,
              child: Form(
                key: model.formKey,
                child: Column(
                  children: [
                    const Logo(),
                    const SizedBox(height: 50),
                    const SelectableText(
                      "Sign in to townsquare",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      controller: model.emailController,
                      textInputType: TextInputType.text,
                      validator: model.validateEmail,
                      label: "Email",
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: model.passwordController,
                      textInputType: TextInputType.text,
                      validator: model.validatePassword,
                      label: "Password",
                    ),
                    const SizedBox(height: 30),
                    SubmitButton(
                      isLoading: model.isBusy,
                      label: "Sign In",
                      submit: () => model.signIn(),
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(children: [
                        const TextSpan(text: "Don't have an account? "),
                        TextSpan(
                          text: " Sign up",
                          style: TextStyle(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              locator<NavigationService>()
                                  .navigateTo(Routes.signUp);
                            },
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
