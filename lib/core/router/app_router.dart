

import 'package:bebe/auth/presentation/pages/home_page.dart';
import 'package:bebe/auth/presentation/pages/login_with_google.dart';
import 'package:bebe/auth/presentation/pages/wrapper.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
  GoRoute(path: "/",builder: (context, state) => Wrapper(),),
  GoRoute(path: "/LoginwithGoogle",builder: (context, state) => LoginWithGoogle(),),
  GoRoute(path: "/homePage",builder: (context, state) => HomePage(),),
]);