import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/ui/components/header_mobile.dart';
import 'package:townsquare/ui/components/header_web.dart';
import 'package:townsquare/ui/components/loader.dart';
import 'package:townsquare/ui/views/forum/forum_view_model.dart';
import 'package:townsquare/ui/views/home/widgets/post_row.dart';

class ForumMobile extends StatelessWidget {
  final String category;

  const ForumMobile({
    required this.category,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForumViewModel>.reactive(
      onModelReady: (model) {
        model.getPostByCategory(category);
      },
      viewModelBuilder: () => ForumViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: headerMobile,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width / 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                children: [
                  Text(
                    category,
                    style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  const SizedBox(width: 50),
                  model.posts == null
                      ? Column(
                          children: const [
                            SizedBox(height: 50),
                            Loader(),
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.posts!.length,
                          itemBuilder: (context, index) {
                            Post post = model.posts![index];
                            return PostRow(
                              post: post,
                            );
                          },
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
