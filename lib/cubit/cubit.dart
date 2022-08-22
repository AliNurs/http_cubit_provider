// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http_cubit_provider/data/post_model.dart';
import 'package:http_cubit_provider/repository/post_repo.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({required PostRepo postRepo})
      : _postRepo = postRepo,
        super(PostInitialState()) {
    // getPosts();
  }

  late final PostRepo _postRepo;

  getPosts() async {
    emit(PostLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final result = await _postRepo.getPost();
      final data = json.decode(result.body) as List;
      final post = data.map((e) => PostModel.fromJson(e)).toList();
      emit(PostSuccesState(posts: post));
    } catch (e) {
      emit(PostErrorState());
    }
  }

  clearPosts() {
    emit(PostSuccesState(posts: []));
  }
}

abstract class PostState {}

class PostInitialState extends PostState {}

class PostLoadingState extends PostState {}

class PostErrorState extends PostState {}

class PostSuccesState extends PostState {
  final List<PostModel> posts;
  PostSuccesState({required this.posts});
}
