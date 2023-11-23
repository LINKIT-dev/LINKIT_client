import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view/copylink.dart';
import '../view/tag.dart';
import 'tag_detail_page.dart';

void showPost(BuildContext context, String image_url, String title,
    String description, String _url, List<String> tags) {
  // List<String> tags = tag.split(',');

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height * 0.8,
        //margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xffDDCEDD),
              Colors.white,
            ],
          ),
          //borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      CopyLink(_url);
                      Get.snackbar(
                        '자유롭게 링크를 공유하세요!!',
                        '클립보드에 ${_url} 복사됨',
                        snackPosition: SnackPosition.BOTTOM,
                        forwardAnimationCurve: Curves.elasticInOut,
                        reverseAnimationCurve: Curves.easeOut,
                        backgroundColor: const Color(0xffDDCEDD),
                      );
                    },
                    icon: const Icon(Icons.copy),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Text(title,
                        style: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: IconButton(
                        onPressed: () async {
                          final url = Uri.parse(
                            _url,
                          );
                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        icon: Image.network(image_url),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Wrap(
                    spacing: 8.0, // 태그 사이의 가로 간격
                    runSpacing: 4.0, // 태그 사이의 세로 간격
                    children: tags
                        .map((tag) => ElevatedButton(
                              onPressed: () {
                                Get.to(() => TagDetailPage(), arguments: tag);
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color(Rand_col())), //수정
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.only(top: 5, bottom: 5)),
                              ),
                              child: Text(
                                tag,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
                // 여기에 모달 내부에 들어갈 위젯들을 추가합니다.
              ),
            ),
          ),
        ),
      );
    },
  );
}
