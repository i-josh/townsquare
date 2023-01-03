import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/ui/components/submit_button.dart';
import 'package:townsquare/ui/components/text_field_widget.dart';
import 'package:townsquare/ui/views/auth/sign_up/sign_up_viewmodel.dart';

import '../../../components/logo.dart';
import '../../../values/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
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
                      "Sign up to townsquare",
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    TextFieldWidget(
                      controller: model.usernameController,
                      textInputType: TextInputType.text,
                      label: "Username",
                      validator: model.validateUsername,
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: model.emailController,
                      textInputType: TextInputType.emailAddress,
                      label: "Email",
                      validator: model.validateEmail,
                    ),
                    const SizedBox(height: 20),
                    TextFieldWidget(
                      controller: model.passwordController,
                      textInputType: TextInputType.visiblePassword,
                      label: "Password",
                      validator: model.validatePassword,
                    ),
                    const SizedBox(height: 30),
                    SubmitButton(
                      isLoading: model.isBusy,
                      label: "Sign Up",
                      submit: model.signUp,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 50),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: "Back to Sign in",
                          style: TextStyle(color: AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              locator<NavigationService>().back();
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
