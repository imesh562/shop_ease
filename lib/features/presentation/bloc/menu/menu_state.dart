part of 'menu_bloc.dart';

@immutable
abstract class MenuState extends BaseState<MenuState> {}

class MenuInitial extends MenuState {}

class GetMenuListSuccessState extends MenuState {
  final MenuResult? menuResult;

  GetMenuListSuccessState({required this.menuResult});
}
