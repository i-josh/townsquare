import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/di/service_locator.dart';

import '../../../core/app/app.router.dart';
import '../../components/logo.dart';
import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import '../../values/colors.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 60,
      color: AppColors.secondary.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(onTap: () {}, child: const Logo()),
          SizedBox(
            width: 600,
            height: 40,
            child: TextFieldWidget(
              controller: TextEditingController(),
              maxLines: 1,
              textInputType: TextInputType.text,
              label: "search townsquare",
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const Text(
                "Advertise",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 100,
                child: SubmitButton(
                  isLoading: false,
                  boldText: true,
                  label: "Sign In",
                  submit: () {
                    locator<NavigationService>().navigateTo(Routes.signIn);
                  },
                  color: AppColors.primary,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
