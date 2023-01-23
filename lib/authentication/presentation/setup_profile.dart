import 'package:agrostack/authentication/infrastructure/auth_controller.dart';
import 'package:agrostack/core/services/validation_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentProfileProvider = StateProvider<String>((ref) {
  return 'Farmer';
});

class SteupProfile extends ConsumerStatefulWidget {
  const SteupProfile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SteupProfileState();
}

class _SteupProfileState extends ConsumerState<SteupProfile> {
  final List<String> _profileType = [
    'Farmer',
    'Distributer',
    'Supplier',
    'Seller',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              'Setup profile',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Select profile type to continue'),
            const SizedBox(height: 50),
            ..._profileType.map(
              (e) => GestureDetector(
                onTap: () {
                  ref.read(currentProfileProvider.notifier).update(
                        (state) => e,
                      );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: ref.watch(currentProfileProvider) == e
                    //     ? Colors.green
                    //     : null,
                    border: ref.watch(currentProfileProvider) != e
                        ? Border.all(color: Colors.grey.shade800)
                        : Border.all(color: Colors.green),
                  ),
                  child: ListTile(
                    title: Text(e),
                    trailing: ref.watch(currentProfileProvider) == e
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ProfileForm(),
                    ),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileForm extends ConsumerStatefulWidget {
  const ProfileForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileFormState();
}

class _ProfileFormState extends ConsumerState<ProfileForm> {
  final TextEditingController _contactNumberController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Setup ${ref.watch(currentProfileProvider)} Profile',
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                const Text('Fill the detail to create profile okay'),
                const SizedBox(height: 60),
                TextFormField(
                  controller: _contactNumberController,
                  validator: ValidationService.notEmpty,
                  decoration: const InputDecoration(
                    labelText: 'Contact Number',
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_contactNumberController.text.isEmpty) return;
                      ref.read(authNotifierProvider.notifier).setupProfile(
                        context: context,
                        data: {
                          'role':
                              ref.watch(currentProfileProvider).toUpperCase(),
                          'contact': _contactNumberController.text.trim(),
                        },
                      );
                    },
                    child: const Text('Complet Setup'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
