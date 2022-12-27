import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:townsquare/core/app/app.router.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:timeago/timeago.dart' as timeAgo;

import '../../../components/profile_picture.dart';
import '../../../values/colors.dart';

class PostRow extends StatelessWidget {
  final Post post;

  const PostRow({
    required this.post,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator<NavigationService>().navigateTo(Routes.postDetail);
      },
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        const ProfilePicture(),
                        const SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "@${post.user![0].username}",
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              timeAgo.format(DateTime.parse(post.createdAt!)),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.more_horiz,
                    size: 15,
                    color: Colors.grey,
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 0,
                        offset: Offset(3, 3))
                  ],
                  color: AppColors.secondary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  child: Text(
                    post.category ?? "",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                post.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _postAction(
                          icon: Icons.thumb_up_outlined,
                          value: post.likes!.length.toString(),
                          name: "likes"),
                      const SizedBox(width: 20),
                      _postAction(
                          icon: Icons.messenger_outline,
                          value: "100",
                          name: "comments"),
                      const SizedBox(width: 20),
                      _postAction(
                          icon: Icons.visibility,
                          value: post.views?.toString() ?? "",
                          name: "views"),
                    ],
                  ),
                  const Divider(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _postAction({
    required IconData icon,
    required String value,
    required String name,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        const SizedBox(width: 5),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "$value ",
                style: GoogleFonts.sen(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black),
              ),
              TextSpan(
                text: " $name",
                style: GoogleFonts.sen(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
