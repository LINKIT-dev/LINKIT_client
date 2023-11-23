import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/addlink_model.dart';
import '../model/chat_model.dart';
import '../model/userlike_model.dart';
import 'post.dart';
import 'alert.dart';
import 'comment.dart';
import 'copylink.dart';

class OthChatForm extends StatefulWidget {
  final UserLikeModel like;
  final Links? post; // PostModel 객체를 저장하기 위한 변수

  const OthChatForm({Key? key, required this.post, required this.like})
      : super(key: key);

  @override
  _OthChatFormState createState() => _OthChatFormState();
}

class _OthChatFormState extends State<OthChatForm> {
  bool isIconOne = true; // 이제 상태는 StatefulWidget 내부에 있습니다.

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Container(
      width: screenSize.width * 0.95,
      height: screenSize.height * 0.28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: widget.post != null &&
                    widget.post!.userVO != null &&
                    widget.post!.userVO!.uid != null
                    ? Image.network(widget.post!.userVO!.profileImg!)
                    : Icon(Icons.error),
              ),
              const SizedBox(width: 5),
              Text(
                widget.post != null &&
                    widget.post!.userVO != null &&
                    widget.post!.userVO!.uid != null
                    ? widget.post!.userVO!.uid!
                    : "Usr Name error",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              showPost(
                context,
                widget.post!.linkPreviewImg, // '!' 연산자로 null이 아님을 보증
                widget.post!.title,
                widget.post!.content,
                widget.post!.url,
                widget.post!.tags,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              width: screenSize.width * 0.83,
              height: screenSize.height * 0.19,
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                //   colors: <Color>[
                //     Color(0xffDDCEDD),
                //     Color(0xfff7f3f7),
                //   ],
                // ),
                border: Border.all(color: const Color(0xffDDCEDD), width: 3),
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: screenSize.width * 0.03),
                  widget.post != null
                      ? Image.network(
                    widget.post!.linkPreviewImg!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  )
                      : Image.network("https://i.ibb.co/V9rV08m/logo-003.jpg"),
                  SizedBox(width: screenSize.width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.025),
                      SizedBox(
                        height: 30,
                        width: screenSize.width * 0.49,
                        child: Text(
                          '[ ${widget.post!.title} ]',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.left,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        width: screenSize.width * 0.49,
                        child: Text(
                          widget.post!.content!,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.left,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isIconOne =
                                  !isIconOne; //수정, 하트 누름(true), 취소(false)상태 보내기 .
                                });
                              },
                              icon: Icon(
                                widget.like.user_like
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Color(0xff9a6a9a),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showComment(context);
                              },
                              icon: Icon(
                                Icons.chat_bubble_outline,
                                color: Color(0xff9a6a9a),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                CopyLink(widget.post!.url!);
                                Get.snackbar(
                                  '자유롭게 링크를 공유하세요!!',
                                  '클립보드에 ${widget.post!.url} 복사됨',
                                  snackPosition: SnackPosition.BOTTOM,
                                  forwardAnimationCurve: Curves.elasticInOut,
                                  reverseAnimationCurve: Curves.easeOut,
                                  backgroundColor: const Color(0xffDDCEDD),
                                );
                              },
                              icon: Icon(
                                Icons.content_copy_outlined,
                                color: Color(0xff9a6a9a),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UsrChatForm extends StatefulWidget {
  final UserLikeModel like;
  final Links? post; // PostModel 객체를 저장하기 위한 변수

  const UsrChatForm({Key? key, required this.post, required this.like})
      : super(key: key);

  @override
  _UsrChatFormState createState() => _UsrChatFormState();
}

class _UsrChatFormState extends State<UsrChatForm> {
  bool isIconOne = true; // 이제 상태는 StatefulWidget 내부에 있습니다.

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery
        .of(context)
        .size;

    return Container(
      padding: EdgeInsets.only(right: 15),
      width: screenSize.width * 0.95,
      height: screenSize.height * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (widget.post != null) {
                showPost(
                  context,
                  widget.post!.linkPreviewImg, // '!' 연산자로 null이 아님을 보증
                  widget.post!.title,
                  widget.post!.content,
                  widget.post!.url,
                  widget.post!.tags,
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              width: screenSize.width * 0.83,
              height: screenSize.height * 0.19,
              decoration: const BoxDecoration(
                color: Color(0xffDDCEDD),
                // gradient: LinearGradient(
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                //   colors: <Color>[
                //     Color(0xffDDCEDD),
                //     Color(0xfff7f3f7),
                //   ],
                // ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: screenSize.width * 0.03),
                  Image.network(
                    widget.post!.linkPreviewImg!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: screenSize.width * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: screenSize.height * 0.025),
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: screenSize.width * 0.40,
                            child: Text(
                              '[ ${widget.post!.title!} ]',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                              textAlign: TextAlign.left,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Color(0xff9a6a9a),
                            ),
                            onPressed: () async {
                              bool result = await showErrorDialog_TF(
                                  context,
                                  'Link를 삭제하시겠습니까?',
                                  '삭제한 Link는 복구할 수 없습니다',
                                  '삭제',
                                  '취소');
                              if (result) {
                                // 확인 버튼을 눌렀을 때의 동작
                                DeleteLink deletelink = DeleteLink();
                                // '!' 연산자로 null이 아님을 보증

                                deletelink.deleteLink(
                                    widget.post!.url!, widget.post!.title!,
                                    widget.post!.content!,
                                    widget.post!.linkPreviewImg!, 1,
                                    widget.post!.tags!);
                              } else {
                                // 취소 버튼을 눌렀을 때의 동작

                              }
                            },
                            padding: const EdgeInsets.all(4), // 패딩 조절
                            constraints: const BoxConstraints(
                              // 버튼의 최대, 최소 크기 조절
                              minWidth: 30,
                              minHeight: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 40,
                        width: screenSize.width * 0.49,
                        child: Text(
                          widget.post!.content!,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                          ),
                          textAlign: TextAlign.left,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isIconOne =
                                  !isIconOne; // 상태를 변경하고 위젯을 다시 빌드합니다.
                                });
                              },
                              icon: Icon(
                                widget.like.user_like
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Color(0xff9a6a9a),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                showComment(context);
                              },
                              icon: Icon(
                                Icons.chat_bubble_outline,
                                color: Color(0xff9a6a9a),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                CopyLink(widget.post!.url!);
                                Get.snackbar(
                                  '자유롭게 링크를 공유하세요!!',
                                  '클립보드에 ${widget.post!.url!} 복사됨',
                                  snackPosition: SnackPosition.BOTTOM,
                                  forwardAnimationCurve: Curves.elasticInOut,
                                  reverseAnimationCurve: Curves.easeOut,
                                  backgroundColor: const Color(0xffDDCEDD),
                                );
                              },
                              icon: Icon(
                                Icons.content_copy_outlined,
                                color: Color(0xff9a6a9a),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
