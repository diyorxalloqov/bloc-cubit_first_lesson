import 'package:bloc_cubit/cubit/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserCubit bloc = context.read<UserCubit>();
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text("Bloc/Cubit"),
        ),
        body: Builder(builder: (context) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.green),
            );
          } else if (state is UserErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is UserCompleteState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.users[index].name.toString()),
                );
              },
              itemCount: state.users.length,
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.deleteUser();
          },
          child: const Text("delete"),
        ),
      ),
    );
  }
}
