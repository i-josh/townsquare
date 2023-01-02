import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:townsquare/core/models/comment.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/ui/components/header_web.dart';
import 'package:townsquare/ui/components/profile_picture.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:townsquare/ui/values/colors.dart';
import 'package:townsquare/ui/views/home/home_viewmodel.dart';
import 'package:townsquare/ui/views/home/widgets/comment_row.dart';

class PostDetailWeb extends StatelessWidget {
  final Post post;

  const PostDetailWeb({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.getPostComments(post);
        model.incrementViews(post);
      },
      onDispose: (model) {
        model.disposeData();
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 70),
          child: const HeaderWeb(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const ProfilePicture(),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "@${post.user![0].username}",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      timeAgo.format(
                                          DateTime.parse(post.createdAt!)),
                                      style: const TextStyle(
                                          fontSize: 10, color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const Icon(
                              Icons.more_horiz,
                              size: 15,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 12),
                            child: Text(
                              post.category ?? "",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          post.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          post.body ?? "",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
                                // _postAction(
                                //     icon: Icons.messenger_outline,
                                //     value: "${model.comments?.length ?? ""}",
                                //     name: "comments"),
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
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      children: [
                        Center(
                          child: Text(
                            "Comments (${model.comments?.length ?? "0"})",
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        model.comments == null
                            ? const SizedBox()
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: model.comments!.length,
                                itemBuilder: (context, index) {
                                  Comment comment = model.comments![index];
                                  return CommentRow(comment: comment);
                                })
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black),
              ),
              TextSpan(
                text: " $name",
                style: const TextStyle(
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
