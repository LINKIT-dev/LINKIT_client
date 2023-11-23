import 'package:dio/dio.dart';

const String URL = "http://43.202.242.40:8080";
const int pColor = 0xffDDCEDD;
const int dColor = 0xffC9BAC9;
String accessToken = '';
Dio dio = Dio(); // Dio 인스턴스 생성