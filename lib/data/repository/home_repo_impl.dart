
import 'package:im_arch_demo/di/injector.dart';
import 'package:injectable/injectable.dart';

import '../../remote/base/api_provider.dart';
import '../../remote/entities/post_entity.dart';
import '../source/home_repo.dart';

@injectable
class PostRepositoryImpl implements PostRepository {
  late final ApiProvider apiProvider;

  PostRepositoryImpl(){
    apiProvider = inject();
  }

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      final posts = await apiProvider.fetchData();
      return posts;
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}