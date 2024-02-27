import 'package:machine_test1/presentation/screen/home/screen/home_screen.dart';
import 'package:machine_test1/presentation/screen/login/screens/login_screen.dart';
import 'package:machine_test1/presentation/screen/splash/screens/splash_screen.dart';

final routes={
        '/': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        // '/users': (context) => const UserManagementScreen(),
        // '/communities': (context) => const AllCommunities(),
        // '/allComplaints': (context) => const AllComplaints(),
        // '/allPost': (context) => const AllPostsScreen(),
        // '/searchUser': (context) => const SearchUserScreen(),
      };