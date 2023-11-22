import 'package:flutter/services.dart';

void CopyLink(String _url) {
  Clipboard.setData(ClipboardData(text: _url));
}
