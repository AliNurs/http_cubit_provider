// ignore_for_file: unused_import

import 'package:http/http.dart' as http;

class PostRepo {
  PostRepo() {
    // ignore: avoid_print
    print('Эсли lazy:false сразу работает этот метод');
  }

  Future<http.Response> getPost() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    // final result = await http.get(url);
    // print(result.body);
    return await http.get(url);
  }
}
