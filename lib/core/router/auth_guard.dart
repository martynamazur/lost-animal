import 'dart:developer' as developer;

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = FirebaseAuth.instance.currentUser;
    final curr = router.current.name;

    if (user != null) {
      // Użytkownik zalogowany → kontynuuj
      // zatrzymuje oryginalną trasę i kończy przekierowanie — nie następuje ponowne wywołanie guardów.
      developer.log('User logged in $user');
      resolver.next(true);
    } else {
      // Niezalogowany → jeśli nie jesteś już na loginie, przejdź tam i zakończ
      developer.log('Przeszlo do login');
      if (curr != LoginRoute.name) {
        router.replace(const LoginRoute());
      }
      resolver.next(false);
    }
  }
}
