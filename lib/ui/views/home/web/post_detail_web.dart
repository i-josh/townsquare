import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:townsquare/core/models/comment.dart';
import 'package:townsquare/core/models/post.dart';
import 'package:townsquare/globals.dart';
import 'package:townsquare/ui/components/header_web.dart';
import 'package:townsquare/ui/components/profile_picture.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:townsquare/ui/components/submit_button.dart';
import 'package:townsquare/ui/components/text_field_widget.dart';
import 'package:townsquare/ui/values/colors.dart';
import 'package:townsquare/ui/views/home/home_viewmodel.dart';
import 'package:townsquare/ui/views/home/widgets/comment_row.dart';

class PostDetailWeb extends StatefulWidget {
  final Post post;

  const PostDetailWeb({required this.post, Key? key}) : super(key: key);

  @override
  State<PostDetailWeb> createState() => _PostDetailWebState();
}

class _PostDetailWebState extends State<PostDetailWeb> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.getPostComments(widget.post.sId!);
        model.incrementViews(widget.post);
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
                                      "@${widget.post.user!.username}",
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      timeAgo.format(DateTime.parse(
                                          widget.post.createdAt!)),
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
                              widget.post.category ?? "",
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
                        SelectableText(
                          widget.post.title ?? "",
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SelectableText(
                          widget.post.body ?? "",
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
                                InkWell(
                                  onTap: () {},
                                  child: _postAction(
                                    icon: model.hasLikedPost(widget.post)
                                        ? Icons.thumb_up
                                        : Icons.thumb_up_outlined,
                                    value: widget.post.likes!.length.toString(),
                                    name: "likes",
                                    color: model.hasLikedPost(widget.post)
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                // _postAction(
                                //     icon: Icons.messenger_outline,
                                //     value: "${model.comments?.length ?? ""}",
                                //     name: "comments"),
                                // const SizedBox(width: 20),
                                _postAction(
                                    icon: Icons.visibility,
                                    value: widget.post.views?.toString() ?? "",
                                    name: "views"),
                                const SizedBox(width: 20),
                                tokenValueNotifier.value != null
                                    ? InkWell(
                                        onTap: () {
                                          model.toggleShowReplying();
                                        },
                                        child: _postAction(
                                            icon: Icons.reply,
                                            value: "",
                                            name: "reply"),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                            const Divider(),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  model.showReplying
                      ? SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFieldWidget(
                                  minLines: 4,
                                  maxLines: 4,
                                  controller: model.commentController,
                                  textInputType: TextInputType.text,
                                  label: "Write something..."),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 100,
                                child: SubmitButton(
                                  isLoading: model.isReplyingToPost,
                                  label: "Reply",
                                  submit: () => model.addComment(widget.post),
                                  color: AppColors.primary,
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      // physics: const NeverScrollableScrollPhysics(),
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
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: model.comments!.length,
                                itemBuilder: (context, index) {
                                  Comment comment = model.comments![index];
                                  return CommentRow(
                                    comment: comment,
                                    model: model,
                                  );
                                }),
                        const SizedBox(height: 50),
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
    Color? color,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
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
