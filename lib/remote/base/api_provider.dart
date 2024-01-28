import 'package:dio/dio.dart';
import 'package:im_arch_demo/logger/logger.dart';
import 'package:injectable/injectable.dart';

import '../entities/post_entity.dart';

@injectable
class ApiProvider {
  final Dio dio = Dio();
  Future<List<Post>> fetchData() async {
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    logger.d(response.data);

    if (response.statusCode == 200) {
      logger.d('Success');
      List<dynamic> responseData = response.data;
      List<Post> posts = responseData.map((post) {
        return Post.fromJson(post);
      }).toList();
      return posts;
    } else {
      throw Exception('Failed to load data');
    }
  }
}