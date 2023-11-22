import 'package:flutter/material.dart';

void showComment(BuildContext context) {
  final TextEditingController _controller = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: Text(
                  'COMMENT',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    color: Color(0xffDDCEDD),
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(5, 5),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Scrollbar(
                  thickness: 6.0,
                  // 스크롤바의 두께를 설정합니다.
                  radius: const Radius.circular(10),
                  child: ListView.builder(
                    itemCount: 9,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.account_circle,
                                  size: 40,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Username',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "23.11.17 12:39",
                                        // timeago를 사용하여 시간 표시
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      '우왕 정말 유익한 정보인듯 !'
                                      ' 정말 배고프다'
                                      ' 개발 언제 끝나징?'
                                      ' 종강 대체 언제하징 ??',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey[700],
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.account_circle,
                        size: 30,
                        color: Colors.grey[700],
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: '댓글을 입력하세요...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Color(0xffDDCEDD),
                      ),
                      onPressed: () {
                        String comment = _controller.text;
                        // TODO: 댓글 전송 로직 구현
                        print('댓글: $comment');
                        _controller.clear();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
