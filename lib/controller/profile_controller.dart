import 'package:get/get.dart';
import '../model/profile_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class ProfileController extends GetxController {
  var pm = ProfileModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostFromJson();
  }

  Future<void> fetchPostFromJson() async {
    final String response =
        await rootBundle.loadString('assets/test/profile.json');
    final data = await json.decode(response);
    pm.value = ProfileModel.fromJson(data);
  }
}
