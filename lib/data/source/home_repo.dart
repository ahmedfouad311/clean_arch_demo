import '../../remote/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}