import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.router.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/ui/components/header_mobile.dart';
import 'package:townsquare/ui/components/loader.dart';
import 'package:townsquare/ui/components/logo.dart';
import 'package:townsquare/ui/components/profile_picture.dart';
import 'package:townsquare/ui/values/colors.dart';
import 'package:townsquare/ui/views/home/home_viewmodel.dart';
import 'package:townsquare/ui/views/home/widgets/post_row.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.getPosts();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        drawer: Container(),
        appBar: headerMobile,
        body: model.posts == null
            ? const Center(
                child: Loader(),
              )
            : ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text(
                    "Trending Gist",
                    style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: model.posts!.length,
                      itemBuilder: (context, index) {
                        Post post = model.posts![index];
                        return PostRow(post: post);
                      })
                ],
              ),
      ),
    );
  }
}
