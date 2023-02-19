import 'package:flutter/material.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/ui/responsive/responsive_layout.dart';

import 'mobile/post_detail_mobile.dart';
import 'web/post_detail_web.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobile: PostDetailMobile(post: post), web: PostDetailWeb(post: post));
  }
}
