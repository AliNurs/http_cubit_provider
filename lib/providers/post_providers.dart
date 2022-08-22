// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../data/post_model.dart';
import '../repository/post_repo.dart';

class PostProvider extends ChangeNotifier {
  PostProvider({
    required this.postRepo,
  });
  String errorMessage = '';
  bool isLoading = false;

  final PostRepo postRepo;
  List<PostModel> posts = [];

  getPosts() async {
    // await Future.delayed(Duration(seconds: 1));

    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
    try {
      final result = await postRepo.getPost();
      final listJson = json.decode(result.body) as List;
      posts = listJson.map((e) => PostModel.fromJson(e)).toList();
      // ignore: avoid_print
      print('Succes availible');
    } catch (e) {
    
      // ignore: avoid_print
      print('ErrorData');
      errorMessage = 'Проверьте подключение Интернета';
    }
    isLoading = false;
    notifyListeners();
  }
}
