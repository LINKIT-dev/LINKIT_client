import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import '../view/alert.dart';

final TextEditingController _urlController = TextEditingController();
final TextEditingController _titleController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
final TextEditingController _imageController = TextEditingController();
final TextEditingController _tagController = TextEditingController();

// URL에서 데이터를 가져오는 함수
class LinkAdd extends StatefulWidget {
  const LinkAdd({super.key});

  @override
  State<LinkAdd> createState() => _LinkAddState();
}

class _LinkAddState extends State<LinkAdd> {
  String _imageUrl = '';

  Future<void> fetchUrlData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var document = parser.parse(response.body);
      String title = document.head?.querySelector('title')?.text ?? '';
      String description = document
              .querySelector('meta[name="description"]')
              ?.attributes['content'] ??
          '';
      String imageUrl = document
              .querySelector('meta[property="og:image"]')
              ?.attributes['content'] ??
          '';

      // 파싱한 데이터를 TextEditingController에 설정합니다.
      // setState를 호출하여 UI를 업데이트합니다.
      setState(() {
        _titleController.text = title;
        _descriptionController.text = description;
        _imageController.text = imageUrl;
        _imageUrl = imageUrl; // 이미지 URL 상태 업데이트
      });
    } else {
      // 에러 처리
      print('Failed to load the webpage');
    }
  }

// 모든 입력 필드를 비우고 모달을 닫는 함수
  void CloseModal() {
    _urlController.clear();
    _titleController.clear();
    _descriptionController.clear();
    _imageController.clear();
    _tagController.clear();
    setState(() {
      _imageUrl = ''; // 이미지 URL 상태도 비웁니다.
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: IconButton(
        icon: const Icon(
          Icons.add_circle_outlined,
          color: Color(0xffDDCEDD),
          size: 55,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              double bottomPadding = MediaQuery.of(context).viewInsets.bottom;
              return Padding(
                padding: EdgeInsets.only(bottom: bottomPadding),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  margin:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                  // 모달 좌우하단 여백 크기
                  decoration: const BoxDecoration(
                    color: Colors.white, // 모달 배경색
                    borderRadius: BorderRadius.all(
                      Radius.circular(20), // 모달 전체 라운딩 처리
                    ),
                  ),
                  child: Scrollbar(
                    // Scrollbar 위젯을 추가합니다.
                    thumbVisibility: true,
                    // 항상 스크롤바를 표시하도록 설정합니다. (Flutter 2 이전 버전에서 사용)
                    thickness: 6.0,
                    // 스크롤바의 두께를 설정합니다.
                    radius: const Radius.circular(10),
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      // 스크롤 기능을 추가하기 위해 SingleChildScrollView를 사용
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '🔗Uploading a ',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                Text(
                                  'new link🔗',
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    color: Color(0xffd6c2d6),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _urlController,
                              decoration: const InputDecoration(
                                labelText: 'Enter URL',
                                icon: Icon(Icons.mode_edit_outline_outlined),
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onSubmitted: (String value) async {
                                await fetchUrlData(value);
                              },
                            ),
                            Image.network(
                              _imageUrl,
                              key: ValueKey(_imageUrl),
                              // 이미지가 변경될 때마다 새로운 키를 제공
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                // 이미지 로드에 실패한 경우 여기서 처리합니다.
                                return Image.asset('assets/image/logo_003.jpg');
                              },
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _imageController,
                              decoration: const InputDecoration(
                                labelText: 'Image URL',
                                icon: Icon(Icons.insert_link),
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              onChanged: (value) {
                                // 이미지 URL이 변경될 때마다 상태를 업데이트합니다.
                                setState(() {
                                  _imageUrl = value;
                                });
                              },
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                  labelText: 'Title',
                                  labelStyle: TextStyle(
                                    fontSize: 20,
                                  ),
                                  icon: Icon(Icons.text_fields)),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _descriptionController,
                              decoration: const InputDecoration(
                                labelText: 'Description',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                icon: Icon(Icons.library_books),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: _tagController,
                              decoration: const InputDecoration(
                                labelText: 'Tag',
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                icon: Icon(Icons.tag),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {

                                // 필드 검사
                                if (_urlController.text.isEmpty) {
                                  // url 필드가 비었을 때
                                  setState(() {
                                    showErrorDialog(context, "필드가 비어있음",
                                        "url을 작성해주세요 !", "닫기");
                                  });
                                } else if (_titleController.text.isEmpty) {
                                  // title 필드가 비었을 때
                                  setState(() {
                                    showErrorDialog(context, "필드가 비어있음",
                                        "title을 작성해주세요 !", "닫기");
                                  });
                                } else if (_descriptionController
                                    .text.isEmpty) {
                                  // description 필드가 비었을 때
                                  setState(() {
                                    showErrorDialog(context, "필드가 비어있음",
                                        "description을 작성해주세요 !", "닫기");
                                  });
                                } else if (_imageController.text.isEmpty) {
                                  // image 필드가 비었을 때 기본 이미지 삽입
                                  _imageUrl =
                                      ('https://i.ibb.co/V9rV08m/logo-003.jpg');
                                  _imageController.text = _imageUrl;
                                } else if (_tagController.text.isEmpty) {
                                  // tag 필드가 비었을 때
                                  setState(() {
                                    showErrorDialog(context, "필드가 비어있음",
                                        "tag를 작성해주세요 !", "닫기");
                                  });
                                } else {
                                  // 모든 필드가 채워져 있다면 필드를 비우고 모달을 닫기
                                  // addChatWidget();
                                  CloseModal();
                                  Navigator.pop(context);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffd6c2d6)),
                              ),
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
              // 모달 내부 디자인 영역
            },
            backgroundColor: Colors.transparent, // 앱 <=> 모달의 여백 부분을 투명하게 처리
          );
        }, //onPressed_IconButton
      ),
    );
  }
}
