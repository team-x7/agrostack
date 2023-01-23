import 'package:agrostack/authentication/presentation/authentication_scree.dart';
import 'package:agrostack/foods/infrastructure/location_serice.dart';
import 'package:agrostack/l10n/l10n.dart';
import 'package:agrostack/profile/presentation/profile_screen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initProvider = FutureProvider<Unit>((ref) async {
  return unit;
});

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(locationProvider, (previous, next) {});
    return MaterialApp(
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          accentColor: Colors.green,
          primarySwatch: Colors.green,
        ),
      ),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => Colors.green,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(color: Colors.green),
        // brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.green,
          primarySwatch: Colors.green,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ref.watch(languageProvider),
      home: const AuthWrapper(),
    );
  }
}
