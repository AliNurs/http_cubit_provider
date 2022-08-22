import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_cubit_provider/cubit/cubit.dart';
import 'package:http_cubit_provider/repository/post_repo.dart';
import 'package:http_cubit_provider/screens/widgets/myListTile_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit on Http'),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<PostCubit>(context).clearPosts();
            },
            icon: const Icon(Icons.clear_all_outlined),
          ),
          IconButton(
            onPressed: () {
              RepositoryProvider.of<PostRepo>(context).getPost();
              BlocProvider.of<PostCubit>(context).getPosts();
            },
            icon: const Icon(Icons.get_app),
          ),
        ],
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PostErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 40,
                    ),
                    Text('Proverte Internet i Najmite Knopku'),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<PostCubit>(context).getPosts();
                    },
                    child: const Text('Povtorite'))
              ],
            );
          }
          if (state is PostSuccesState) {
            return state.posts.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, index) {
                      return MyListTileItem(
                          id: state.posts[index].id.toString(),
                          title: state.posts[index].title,
                          subtitle: state.posts[index].subtitle);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: state.posts.length)
                : const Center(
                    child: Text('Spisok uspeshno ochishen'),
                  );
          }
          return const Center(
              child: Text('List is Empty, Please Click on Button'));
        },
      ),
    );
  }
}
