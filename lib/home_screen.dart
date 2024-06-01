import 'package:flutter/material.dart';
import 'package:teste_artigo/home_screen_view_model.dart';

import 'home_screen_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  late final HomeScreenViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = HomeScreenViewModel();
    _vm.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('State Management'),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      body: _buildBody(),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _vm.onRefreshUserData(),
      tooltip: 'Refresh',
      child: const Icon(Icons.refresh),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: _vm.state,
          builder: (context, state, _) {
            switch (state.runtimeType) {
              case const (HomeScreenLoadingState):
                return const Center(child: CircularProgressIndicator());
              case const (HomeScreenSuccessfulState):
                final successfulState = state as HomeScreenSuccessfulState;
                return Center(child: Text(successfulState.userName));
              case const (HomeScreenErrorState):
                final errorState = state as HomeScreenErrorState;
                return Center(child: Text(errorState.errorMessage));
              default:
                return Container();
            }
          },
        )
      ],
    );
  }
}
