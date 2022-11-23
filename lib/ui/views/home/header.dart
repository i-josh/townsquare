
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          InkWell(
            onTap: () {},
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Town",
                    style: GoogleFonts.bebasNeue(
                        fontSize: 30, color: Colors.black),
                  ),
                  TextSpan(
                    text: "square",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 30,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
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
          SubmitButton(
            isLoading: false,
            boldText: true,
            label: "Sign Up",
            submit: () {},
            color: AppColors.primary,
          )
        ],
      ),
    );
  }
}