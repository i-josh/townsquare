import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:townsquare/core/app/app.logger.dart';
import 'package:townsquare/core/di/service_locator.dart';
import 'package:townsquare/core/models/comment.dart';
import 'package:townsquare/core/network/api_response.dart';
import 'package:townsquare/core/repositories/home/home_repository.dart';
import 'package:townsquare/globals.dart';
import 'package:townsquare/ui/components/profile_picture.dart';
import 'package:timeago/timeago.dart' as timeAgo;
import 'package:townsquare/ui/components/submit_button.dart';
import 'package:townsquare/ui/components/text_field_widget.dart';
import 'package:townsquare/ui/values/colors.dart';
import 'package:townsquare/ui/views/home/home_viewmodel.dart';

class CommentRow extends StatefulWidget {
  final Comment comment;
  final HomeViewModel model;

  const CommentRow({
    required this.comment,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentRow> createState() => _CommentRowState();
}

class _CommentRowState extends State<CommentRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Column(
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
                              "@${widget.comment.user?[0].username ?? ""}",
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              timeAgo.format(
                                  DateTime.parse(widget.comment.createdAt!)),
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
              const SizedBox(height: 10),
              widget.comment.reply != null && widget.comment.reply!.isNotEmpty
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.comment.replyUser!.isEmpty
                                    ? const SizedBox()
                                    : Text(
                                        "@${widget.comment.replyUser?[0].username ?? ""}",
                                        style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            ),
                          ),
                          Text(
                            widget.comment.reply ?? "",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  : const SizedBox(),
              Text(
                widget.comment.comment ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _postAction(
                          icon: Icons.thumb_up_outlined,
                          value: "${widget.comment.likes?.length ?? 0}",
                          name: "likes"),
                      // const SizedBox(width: 20),
                      // _postAction(
                      //     icon: Icons.messenger_outline,
                      //     value: "100",
                      //     name: "comments"),
                      const SizedBox(width: 20),
                      tokenValueNotifier.value != null
                          ? InkWell(
                              onTap: () {
                                widget.model
                                    .toggleShowCommentReplying(widget.comment);
                              },
                              child: _postAction(
                                  icon: Icons.reply, value: "", name: "reply"),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const Divider(),
                ],
              )
            ],
          ),
          widget.model.replyingTo == widget.comment.sId
              ? SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldWidget(
                          minLines: 4,
                          maxLines: 4,
                          controller: widget.model.replyCommentController,
                          textInputType: TextInputType.text,
                          label: "Write something..."),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 100,
                        child: SubmitButton(
                          isLoading: widget.model.commentReplyingLoading,
                          label: "Reply",
                          submit: () => widget.model.addReply(widget.comment),
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox()
        ],
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
