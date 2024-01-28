part of 'home_cubit.dart';

abstract class HomeStates{}

class InitState extends HomeStates{}

class LoadingState extends HomeStates{}

class SuccessState extends HomeStates{
  final List<Post> posts;

  SuccessState({required this.posts});
}

class ErrorState extends HomeStates{
  final String errorMsg;

  ErrorState({required this.errorMsg});
}