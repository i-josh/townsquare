import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/globals.dart';
import 'package:townsquare/ui/components/profile_picture.dart';
import '../../core/app/app.router.dart';
import 'logo.dart';
import 'submit_button.dart';
import 'text_field_widget.dart';
import '../values/colors.dart';

class HeaderWeb extends StatelessWidget {
  const HeaderWeb({
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
            width: 150.w,
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
          ValueListenableBuilder(
            valueListenable: tokenValueNotifier,
            builder: (context, value, child) => Container(
                child: value == null || value == ""
                    ? SizedBox(
                        width: 100,
                        child: SubmitButton(
                          isLoading: false,
                          boldText: true,
                          label: "Sign In",
                          submit: () {
                            locator<NavigationService>()
                                .navigateTo(Routes.signIn);
                          },
                          color: AppColors.primary,
                        ),
                      )
                    : Row(
                        children: [
                          const ProfilePicture(),
                          const SizedBox(width: 10),
                          const Icon(Icons.notifications),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 100,
                            child: SubmitButton(
                              isLoading: false,
                              boldText: true,
                              icon: Icons.post_add,
                              label: "Add Post",
                              submit: () {},
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      )),
          ),
        ],
      ),
    );
  }
}
