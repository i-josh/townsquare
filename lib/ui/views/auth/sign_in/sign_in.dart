import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:townsquare/ui/components/submit_button.dart';
import 'package:townsquare/ui/components/text_field_widget.dart';

import '../../../components/logo.dart';
import '../../../values/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary.withOpacity(0.5),
      body: Center(
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(30),
            height: 600,
            width: 500,
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
                  controller: TextEditingController(),
                  textInputType: TextInputType.text,
                  label: "Email",
                ),
                const SizedBox(height: 20),
                TextFieldWidget(
                  controller: TextEditingController(),
                  textInputType: TextInputType.text,
                  label: "Password",
                ),
                const SizedBox(height: 30),
                SubmitButton(
                  isLoading: false,
                  label: "Sign In",
                  submit: () {},
                  color: AppColors.primary,
                ),
                const SizedBox(height: 50),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: " Sign up",
                      style: TextStyle(color: AppColors.primary),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
