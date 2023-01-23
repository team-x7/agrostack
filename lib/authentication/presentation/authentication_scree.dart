import 'package:agrostack/authentication/infrastructure/auth_controller.dart';
import 'package:agrostack/authentication/presentation/setup_profile.dart';
import 'package:agrostack/authentication/presentation/widgets/custom_google_button.dart';
import 'package:agrostack/core/entity/auth_status/auth_status.dart';
import 'package:agrostack/core/services/validation_services.dart';
import 'package:agrostack/l10n/l10n.dart';
import 'package:agrostack/main_screen/presentation/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authNotifierProvider).maybeMap(
          authenticated: (_) => const MainScreen(),
          setupProfile: (_) => const SteupProfile(),
          orElse: AuthenticationPage.new,
        );
  }
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool isLogin = true;

  void toggleScreen() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginPage(toggleLogin: toggleScreen)
        : SignUpScreen(toggleLogin: toggleScreen);
  }
}

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key, required this.toggleLogin});
  final VoidCallback toggleLogin;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordControoler = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  final _fromkey = GlobalKey<FormState>();
  String _errorMessage = '';

  void clearErrorToast() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeMap(
        failure: (failure) {
          _errorMessage = failure.failure.reason;
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _fromkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    l10n.loginTitle,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(l10n.fillTheFormToContinue),
                  if (_errorMessage.isNotEmpty)
                    MaterialBanner(
                      content: Text(_errorMessage),
                      backgroundColor: Colors.amberAccent,
                      actions: [
                        IconButton(
                          onPressed: clearErrorToast,
                          color: Colors.black,
                          icon: const Icon(Icons.close),
                        )
                      ],
                    )
                  else
                    const SizedBox(),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _fullNameController,
                    validator: ValidationService.notEmpty,
                    decoration: InputDecoration(
                      hintText: 'e.g John doe',
                      labelText: l10n.fullName,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    validator: (_) => ValidationService.isEmail(_, l10n),
                    decoration: InputDecoration(
                      hintText: 'e.g mail@gmail.com',
                      labelText: l10n.fieldEmail,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordControoler,
                    obscureText: true,
                    validator: (_) => ValidationService.password(_, l10n),
                    decoration: InputDecoration(
                      labelText: l10n.fieldPassword,
                      hintText: 'e.g mail@gmail.com',
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_fromkey.currentState!.validate()) {
                          ref
                              .read(authNotifierProvider.notifier)
                              .createAccountWithEmailPassword(
                                fullName: _fullNameController.text.trim(),
                                email: _emailController.text.trim(),
                                password: _passwordControoler.text.trim(),
                              );
                        }
                      },
                      child: ref.watch(authNotifierProvider).status ==
                              AuthStatus.busy
                          ? const Text('Loading..')
                          : Text(l10n.signUpWithEmail),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.alreadyhaveAnAccount),
                      TextButton(
                        onPressed: widget.toggleLogin,
                        child: Text(l10n.loginTitle),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SocialButton(
                    onTap: () {
                      ref
                          .read(authNotifierProvider.notifier)
                          .continueWithGoogleAccount();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, required this.toggleLogin});
  final VoidCallback toggleLogin;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordControoler = TextEditingController();
  String _errorMessage = '';
  final _fromkey = GlobalKey<FormState>();

  void clearErrorToast() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeMap(
        failure: (failure) {
          _errorMessage = failure.failure.reason;
        },
        orElse: () {},
      );
    });
    final l10n = context.l10n;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _fromkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    l10n.loginTitle,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(l10n.loginMessage),
                  const SizedBox(height: 20),
                  if (_errorMessage.isNotEmpty)
                    MaterialBanner(
                      content: Text(_errorMessage),
                      backgroundColor: Colors.amberAccent,
                      actions: [
                        IconButton(
                          onPressed: clearErrorToast,
                          color: Colors.black,
                          icon: const Icon(Icons.close),
                        )
                      ],
                    )
                  else
                    const SizedBox(),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    validator: (_) => ValidationService.isEmail(_, l10n),
                    decoration: InputDecoration(
                      hintText: 'e.g mail@gmail.com',
                      labelText: l10n.fieldEmail,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordControoler,
                    validator: (_) => ValidationService.password(_, l10n),
                    decoration: InputDecoration(
                      labelText: l10n.fieldPassword,
                      hintText: 'e.g mail@gmail.com',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          // ignore: inference_failure_on_instance_creation
                          CupertinoPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(l10n.forgotPassword),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_fromkey.currentState!.validate()) {
                          ref
                              .read(authNotifierProvider.notifier)
                              .loginWithEmail(
                                email: _emailController.text.trim(),
                                password: _passwordControoler.text.trim(),
                              );
                        }
                      },
                      child: ref.watch(authNotifierProvider).status ==
                              AuthStatus.busy
                          ? const Text('Loading..')
                          : Text(l10n.loginWithEmail),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(l10n.dontHaveAnAccount),
                      TextButton(
                        onPressed: widget.toggleLogin,
                        child: Text(l10n.signUpText),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SocialButton(
                    onTap: () {
                      ref
                          .read(authNotifierProvider.notifier)
                          .continueWithGoogleAccount();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  String _errorMessage = '';
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void clearErrorToast() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    ref.listen(authNotifierProvider, (previous, next) {
      next.maybeMap(
        failure: (failure) {
          _errorMessage = failure.failure.reason;
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),
              const SizedBox(height: 50),
              Text(
                l10n.forgotPassword,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text('Forgot password ? good now reset'),
              const SizedBox(height: 20),
              if (_errorMessage.isNotEmpty)
                MaterialBanner(
                  content: Text(_errorMessage),
                  backgroundColor: Colors.amberAccent,
                  actions: [
                    IconButton(
                      onPressed: clearErrorToast,
                      color: Colors.black,
                      icon: const Icon(Icons.close),
                    )
                  ],
                )
              else
                const SizedBox(),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                validator: (_) => ValidationService.isEmail(_, l10n),
                decoration: const InputDecoration(
                  hintText: 'e.g john@mail.com',
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ref
                          .read(authNotifierProvider.notifier)
                          .sendResetPasswordLink(
                            email: _emailController.text.trim(),
                            onVerificationSend: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Password reset link has been send to your email',
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            },
                          );
                    }
                  },
                  child:
                      ref.watch(authNotifierProvider).status == AuthStatus.busy
                          ? const Text('Loading..')
                          : const Text('login with email'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
