import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../provider/auth_gate_notifier.dart';

@RoutePage()
class AuthGateScreen extends ConsumerStatefulWidget {
  const AuthGateScreen({super.key});

  @override
  ConsumerState<AuthGateScreen> createState() => _AuthGateScreenState();
}

class _AuthGateScreenState extends ConsumerState<AuthGateScreen> {
  @override
  void initState() {
    super.initState();
    // Sprawdź stan autoryzacji po zainicjalizowaniu
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthState();
    });
  }

  Future<void> _checkAuthState() async {
    // Najpierw szybkie sprawdzenie czy w ogóle jest użytkownik
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // Brak użytkownika - od razu na login
      if (mounted) {
        context.router.replaceAll([const LoginRoute()]);
      }
      return;
    }

    // Jest użytkownik - sprawdź dokładnie token i stan
    final authGateNotifier = ref.read(authGateNotifierProvider.notifier);
    await authGateNotifier.validateAuthState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authGateNotifierProvider);

    // Nasłuchuj zmian stanu i nawiguj odpowiednio
    ref.listen(authGateNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (result) {
          if (result.isAuthenticated) {
            // Token ważny - przejdź do głównej aplikacji
            context.router.replaceAll([const DashboardRoute()]);
          } else if (result.requiresVerification) {
            // Email wymaga weryfikacji
            // TODO: Dodaj route do weryfikacji email
            context.router.replaceAll([const LoginRoute()]);
          } else {
            // Token nieważny lub brak użytkownika - przejdź do logowania
            context.router.replaceAll([const LoginRoute()]);
          }
        },
        error: (error, stackTrace) {
          // Błąd podczas sprawdzania - przejdź do logowania
          context.router.replaceAll([const LoginRoute()]);
        },
      );
    });

    // Dodatkowe sprawdzenie w czasie rzeczywistym
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Jeśli stream pokazuje że nie ma użytkownika, od razu przekieruj
        if (snapshot.hasData && snapshot.data == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              context.router.replaceAll([const LoginRoute()]);
            }
          });
        }

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo aplikacji
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/appIcon.png',
                    width: 120,
                    height: 120,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.pets,
                          size: 60,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),

                // Nazwa aplikacji
                Text(
                  'Lost Animal',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),

                // Loading indicator lub error
                authState.when(
                  data: (_) => const CircularProgressIndicator(),
                  loading: () => Column(
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 16),
                      Text(
                        'Checking authentication...',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  error: (error, _) => Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Authentication failed',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Redirecting to login...',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
