import 'package:flutter/material.dart';
import 'package:learning_bloc/bloc/product_bloc.dart';
import 'package:learning_bloc/cubit/users_cubit.dart';
import 'package:learning_bloc/debug/bloc_observer.dart';
import 'package:learning_bloc/repo/poducts_repo.dart';
import 'package:learning_bloc/repo/user_repo.dart';
import 'package:learning_bloc/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MultiRepositoryProvider(
    providers: [
      RepositoryProvider(
        create: (context) => ProductsRepo(),
      ),
      RepositoryProvider(
        create: (context) => UserRepo(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc(ProductsRepo()),
        ),
        BlocProvider(
          create: (context) => UsersCubit(UserRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
