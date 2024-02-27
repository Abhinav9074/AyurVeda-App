import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test1/application/home_bloc/home_bloc.dart';
import 'package:machine_test1/presentation/screen/home/screen/home_screen.dart';
import 'package:machine_test1/presentation/screen/login/screens/login_screen.dart';
import 'package:machine_test1/presentation/screen/splash/screens/splash_screen.dart';

final routes = {
  '/': (context) =>  BlocProvider(
        create: (context) => HomeBloc(),
        child:  HomeScreen(),
      ),
  '/splash': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  // '/users': (context) => const UserManagementScreen(),
  // '/communities': (context) => const AllCommunities(),
  // '/allComplaints': (context) => const AllComplaints(),
  // '/allPost': (context) => const AllPostsScreen(),
  // '/searchUser': (context) => const SearchUserScreen(),
};
