import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  final int id;
  final String title;
  final String subtitle;
  PostModel({
    required this.id,
    required this.title,
    required this.subtitle,
  });

  factory PostModel.fromJson(Map<String, dynamic> data) {
    return PostModel(
      id: data['id'] ?? 0,
      title: data['title'] ?? '',
      subtitle: data['body'] ?? '',
    );
  }

  @override
  String toString() => 'PostModel(id: $id, title: $title, subtitle: $subtitle)';
}
