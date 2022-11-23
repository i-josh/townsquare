import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:townsquare/ui/values/colors.dart';

import 'ui/views/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.poppinsTextTheme(),
        highlightColor: AppColors.primary
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
