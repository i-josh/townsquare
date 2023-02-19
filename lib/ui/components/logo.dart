import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../values/colors.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Town",
            style: GoogleFonts.bebasNeue(fontSize: 30, color: Colors.black),
          ),
          TextSpan(
            text: "square",
            style: GoogleFonts.bebasNeue(
              fontSize: 30,
              color: AppColors.primary,
            ),
          ),
          TextSpan(
            text: " ng",
            style: GoogleFonts.nerkoOne(
              fontSize: 15,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
