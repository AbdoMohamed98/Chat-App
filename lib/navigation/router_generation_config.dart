

import 'package:chatapp/navigation/approutes.dart';
import 'package:chatapp/views/chatview.dart';
import 'package:chatapp/views/loginview.dart';
import 'package:chatapp/views/regestrationview.dart';

import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: Approutes.chatview,
    routes: [
      GoRoute(
        path: Approutes.loginview,
        name: Approutes.loginview,
        builder: (context, state) => const Loginview(),
      ),
      GoRoute(path: Approutes.regestrationview,
        name: Approutes.regestrationview,
        builder: (context, state) => const Regestrationview(),
      ),
      GoRoute(path: Approutes.chatview,
        name: Approutes.chatview,
        builder: (context, state) => const Chatview(),
      ),
     
    ],
  );
}
