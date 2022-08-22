import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_cubit_provider/cubit/cubit.dart';
import 'package:http_cubit_provider/providers/post_providers.dart';
import 'package:http_cubit_provider/repository/post_repo.dart';
import 'package:http_cubit_provider/screens/home_screens/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepo(),
      lazy: true,
      child: BlocProvider(
        create: (context) => PostCubit(
          postRepo: RepositoryProvider.of<PostRepo>(context),
        )..getPosts(),
        child: ChangeNotifierProvider(
          create: (context) => PostProvider(postRepo: PostRepo()),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Http on Cubit',
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
