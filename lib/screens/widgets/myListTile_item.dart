// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MyListTileItem extends StatelessWidget {
  const MyListTileItem({
    Key? key,
    required this.id,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String id;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 15,
      leading: Text(
        id,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 2.2,
        ),
      ),
      minLeadingWidth: 16,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
        ),
        maxLines: 3,
      ),
    );
  }
}
