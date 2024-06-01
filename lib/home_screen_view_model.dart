import 'package:flutter/cupertino.dart';
import 'package:teste_artigo/home_screen_state.dart';
import 'package:teste_artigo/user_repository.dart';

class HomeScreenViewModel {
  var state = ValueNotifier<HomeScreenState>(HomeScreenLoadingState());
  final userRepository = UserRepository();

  Future<void> onInit() async {
    _tryToFetchUserData();
  }

  Future<void> onRefreshUserData() async {
    _tryToFetchUserData();
  }

  Future<void> _tryToFetchUserData() async {
    try {
      state.value = HomeScreenLoadingState();
      final response = await userRepository.getUserData();
      state.value = HomeScreenSuccessfulState(response.name);
    } catch (e) {
      state.value = HomeScreenErrorState('An error occurred');
    }
  }
}
