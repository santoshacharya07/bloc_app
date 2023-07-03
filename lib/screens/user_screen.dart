import 'package:flutter/material.dart';
import 'package:learning_bloc/cubit/users_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().onLoadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Screen")),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoadedState) {
            return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: state.userModel.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.userModel[index].email.toString(),
                          style: const TextStyle(fontSize: 22),
                        ),
                        Text(
                          state.userModel[index].name.toString(),
                          style: const TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  );
                }));
          } else if (state is UserErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
