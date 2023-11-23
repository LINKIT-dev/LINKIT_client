import '../meta_data.dart';

class AddLinkModel {
  String? url;
  String? title;
  String? content;
  String? previewImgUrl;
  int? teamId;
  List<String>? hashtagNames;

  AddLinkModel({this.url,
    this.title,
    this.content,
    this.previewImgUrl,
    this.teamId,
    this.hashtagNames});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['title'] = this.title;
    data['content'] = this.content;
    data['previewImgUrl'] = this.previewImgUrl;
    data['teamId'] = this.teamId;
    data['hashtagNames'] = this.hashtagNames;
    return data;
  }
}

class AddLink {
  Future<bool> addLink(String url, String title, String content,
      String previewImgUrl, int teamid, List<String> hashtagNames)async{
    dio.options.baseUrl = URL;

    try {
      final response = await dio
          .post('/link', data: {'url': url, 'title': title, 'content': content,
        'previewImgUrl': previewImgUrl, 'teamId': teamid, 'hashtagNames': hashtagNames});

      if (response.statusCode == 200) {
        print('sucess!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        return true;
      } else {
        // 서버에서 비정상적인 상태 코드를 반환했을 경우
        print('서버 오류: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // 그 외 예외 처리
      print('예외 발생: $e');
      return false;
    }
  }

  }

class DeleteLink {
  Future<bool> deleteLink(String url, String title, String content,
      String previewImgUrl, int teamid, List<String> hashtagNames)async{
    dio.options.baseUrl = URL;

    try {
      final response = await dio
          .delete('/link/여기 !!', data: {'url': url, 'title': title, 'content': content,
        'previewImgUrl': previewImgUrl, 'teamId': teamid, 'hashtagNames': hashtagNames});

      if (response.statusCode == 200) {
        print('delete sucess!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
        return true;
      } else {
        // 서버에서 비정상적인 상태 코드를 반환했을 경우
        print('서버 오류: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // 그 외 예외 처리
      print('예외 발생: $e');
      return false;
    }
  }

}
