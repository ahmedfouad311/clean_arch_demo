import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_arch_demo/data/repository/home_repo_impl.dart';
import 'package:im_arch_demo/di/injector.dart';
import 'package:injectable/injectable.dart';
import '../../../remote/entities/post_entity.dart';

part 'home_states.dart';

@injectable
class HomeCubit extends Cubit<HomeStates>{
  late final PostRepositoryImpl postRepositoryImpl; // Use the repository interface

  HomeCubit(): super (InitState()){
    postRepositoryImpl = inject();
  }

  void fetchPosts() async {
    emit(LoadingState());
    try {
      final posts = await postRepositoryImpl.fetchPosts(); // Use repository method
      emit(SuccessState(posts: posts));
    } catch (e) {
      emit(ErrorState(errorMsg: e.toString()));
    }
  }
}