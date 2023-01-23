import 'package:agrostack/authentication/infrastructure/auth_controller.dart';
import 'package:agrostack/authentication/infrastructure/authenticator.dart';
import 'package:agrostack/l10n/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageProvider = StateProvider<Locale>((ref) {
  return const Locale('en');
});

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final Map<String, Locale> language = {
    'English': const Locale('en'),
    'Nepali': const Locale('ne'),
  };
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(authProvider).currentUser;
    final l10n = context.l10n;

    return Scaffold(
      // appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    l10n.profile,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      ref.read(authNotifierProvider.notifier).logout();
                    },
                    icon: const Icon(Icons.exit_to_app),
                  )
                ],
              ),
              const SizedBox(height: 60),
              if (currentUser != null)
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: currentUser.photoURL != null
                            ? CachedNetworkImageProvider(currentUser.photoURL!)
                            : null,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        currentUser.displayName ?? 'NO name',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        currentUser.email ?? 'no email',
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              const SizedBox(height: 20),
              const Divider(),
              DropdownButtonFormField(
                value: language.keys.first,
                items: language.keys
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (_) {
                  ref.read(languageProvider.notifier).update(
                        (state) => language[_ ?? '']!,
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
