abstract class HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState {}

class HomeScreenSuccessfulState extends HomeScreenState {
  final String userName;

  HomeScreenSuccessfulState(this.userName);
}

class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;

  HomeScreenErrorState(this.errorMessage);
}