import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:im_arch_demo/data/repository/home_repo_impl.dart';
import 'package:im_arch_demo/di/injector.dart';
import 'package:im_arch_demo/presentation/ui/widgets/post_item.dart';

import '../../../bloc/home_bloc/home_cubit.dart';



class HomePage extends StatefulWidget {
  static const ROUTE_NAME = "/home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit cubit;
  late PostRepositoryImpl postRepository;
  @override
  void initState() {
    cubit = inject();
    cubit.fetchPosts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IM Arch Demo'),
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        bloc: cubit,
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorState) {
            return Center(child: Text('Error: ${state.errorMsg}', style: const TextStyle(color: Colors.black),));
          } else if (state is SuccessState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return PostItem(post: post);
              },
            );
          } else {
            return const Center(child: Text('Error')); // Handle other states if needed
          }
        },
      ),
    );
  }
}