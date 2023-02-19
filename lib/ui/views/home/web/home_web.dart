import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:townsquare/core/models/post.dart';

import '../../../components/loader.dart';
import '../home_viewmodel.dart';
import '../widgets/custom_tile.dart';
import '../../../components/header_web.dart';
import '../widgets/post_row.dart';
import '../widgets/sponsored_row.dart';

class HomeWeb extends StatelessWidget {
  const HomeWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.initialize();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: const HeaderWeb(),
        ),
        backgroundColor: Colors.grey[100],
        body: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(30),
                        children: [
                          Text(
                            "Forums",
                            style: GoogleFonts.bebasNeue(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.sp),
                          ),
                          const SizedBox(height: 20),
                          const CustomTile(icon: "sports.png", title: "Sports"),
                          const CustomTile(
                              icon: "tv.png", title: "Entertainment"),
                          const CustomTile(icon: "career.png", title: "Career"),
                          const CustomTile(
                              icon: "romance.png", title: "Romance"),
                          const CustomTile(
                              icon: "politics.png", title: "Politics"),
                          const CustomTile(
                              icon: "business.png", title: "Business"),
                          const CustomTile(
                              icon: "education.png", title: "Education"),
                          const CustomTile(icon: "health.png", title: "Health"),
                          const CustomTile(
                              icon: "properties.png", title: "Properties"),
                          const CustomTile(
                              icon: "automobiles.png", title: "Automobiles"),
                          const CustomTile(icon: "travel.png", title: "Travel"),
                          const CustomTile(icon: "tech.png", title: "Tech")
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trending Gist",
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
                              : Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: model.posts!.length,
                                    itemBuilder: (context, index) {
                                      Post post = model.posts![index];
                                      return PostRow(
                                        post: post,
                                      );
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: ListView(
                        padding: const EdgeInsets.all(30),
                        children: [
                          Text(
                            "Sponsored",
                            style: GoogleFonts.bebasNeue(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.sp),
                          ),
                          model.sponsoredPosts == null
                              ? Column(
                                  children: const [
                                    SizedBox(height: 50),
                                    Loader(),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: model.sponsoredPosts!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    Post post = model.sponsoredPosts![index];
                                    return SponsoredRow(post: post);
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
