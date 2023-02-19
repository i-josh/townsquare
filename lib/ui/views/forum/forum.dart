import 'package:flutter/material.dart';
import 'package:townsquare/ui/responsive/responsive_layout.dart';
import 'package:townsquare/ui/views/forum/mobile/forum_mobile.dart';
import 'package:townsquare/ui/views/forum/web/forum_web.dart';

class Forum extends StatelessWidget {
  final String category;

  const Forum({required this.category, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      web: ForumWeb(category: category),
      mobile: ForumMobile(
        category: category,
      ),
    );
  }
}
